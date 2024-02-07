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