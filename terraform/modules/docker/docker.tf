resource "docker_network" "network" {
  name = "athena-local"
}

resource "docker_image" "app" {
    count   = length(var.services)
    name    = "${var.services[count.index].name}:latest"

    build {
        dockerfile      = var.services[count.index].dockerfile
        path            = var.services[count.index].context
        force_remove    = true
    }
}

resource "docker_container" "app" {
    count       = length(var.services)
    name        = var.services[count.index].name
    image       = docker_image.app[count.index].latest
    restart     = "always"

    volumes {
        container_path  = "/app"
        host_path       = var.services[count.index].context
        read_only       = true
    }

    networks_advanced {
        name    = docker_network.network.name
        aliases = [ var.services[count.index].name ]
    }

    ports {
        internal = var.services[count.index].appPort
        external = var.services[count.index].extPort
    }

    depends_on = [ docker_image.app ]
}

resource "docker_volume" "newrelic_volume" {
  name = "athena-newrelic"
}

resource "docker_container" "newrelic" {
    count = length(var.newrelic_token) != 0 ? 1 : 0

    name        = "athena-newrelic"
    image       = "newrelic/infrastructure:latest"
    restart     = "always"
    privileged  = true
    pid_mode    = "host"
    env         = [
        "NRIA_LICENSE_KEY=${var.newrelic_token}"
    ]

    volumes {
        container_path  = "/host"
        host_path       = "/"
        read_only       = true
    }

    volumes {
        container_path  = "/var/run/docker.sock"
        host_path       = "/var/run/docker.sock"
    }

    volumes {
        container_path  = "/etc/newrelic-infra"
        volume_name     = docker_volume.newrelic_volume.name
    }

    networks_advanced {
        name    = docker_network.network.name
        aliases = ["athena-newrelic"]
    }

    capabilities {
        add = ["SYS_PTRACE"]
    }


    depends_on = [ docker_image.app ]
}

# resource "null_resource" "create_volume" {
#     # for_each = { for i, v in var.infrastructure : i => v }
#     # count = length(var.infrastructure)

#     # provisioner "local-exec" {
#     dynamic "local-exec" {
#         for_each = { for i, v in var.infrastructure : i => v }

#         content {
#             dynamic "command" {
#                 for_each = { for lv in local_exec.value.value.localVolumes : lv.name => lv }

#                 content {
#                     command = "mkdir -p /${command.value.name}-volume"
#                 }
#             }
#         }
#         # for_each = { for v in each.value.localVolumes : v.name => v }
#         # count = length(var.infrastructure[count].localVolumes)
#         # command = "mkdir -p /${each.value.localVolumes[each.key].name}-volume"
#     }
# }



resource "docker_container" "infrastructure" {
    count       = length(var.infrastructure)

    name        = var.infrastructure[count.index].name
    image       = var.infrastructure[count.index].image
    restart     = "always"
    env         = coalesce(var.infrastructure[count.index].env, []) != [] ? var.infrastructure[count.index].env : null

    networks_advanced {
        name    = docker_network.network.name
        aliases = [var.infrastructure[count.index].name]
    }

    ports {
        internal = var.infrastructure[count.index].appPort
        external = var.infrastructure[count.index].extPort
    }

    dynamic "volumes" {
        for_each = coalesce(var.infrastructure[count.index].volumes, [])
        content {
            container_path  = volumes.container
            host_path       = volumes.host
            read_only       = coalesce(volumes.read_only, "") != "" ? volumes.read_only : null
            # provisioner "local-exec" {
            #     command = coalesce(volumes.create_dir, false) != true ? null : "mkdir -p ${volumes.host}"
            # }
        }
    }
}

resource "null_resource" "mkdir" {
    count       = length(var.infrastructure)

    locals {
        volumes = coalesce(var.infrastructure[count.index].volumes, [])
    }
    
    provisioner "local-exec" {
        for_each    = local.volumes
        command     = "mkdir -p ${each.value.host}"
    }
}
