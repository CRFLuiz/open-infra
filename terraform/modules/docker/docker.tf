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