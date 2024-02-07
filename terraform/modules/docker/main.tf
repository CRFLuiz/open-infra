terraform {
    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "2.12.2"
        }
    }
}

provider "docker" {
    host = "unix:///var/run/docker.sock"
}

variable "services" {
    description = ""
    type        = list(object({
        name        = string
        context     = string
        dockerfile  = string
        appPort     = string
        extPort     = string
    }))
}

resource "docker_image" "app" {
    count   = length(var.services)
    name    = "${var.services[count.index].name}:latest"

    build {
        dockerfile      = var.services[count.index].dockerfile
        path            = var.services[count.index].context
        force_remove    = true
        # tag             = "${var.services[count.index].name}:latest"
    }
}

resource "docker_network" "private_network" {
  name = "my_network"
}

resource "docker_container" "ubuntu" {
    count       = length(var.services)
    name        = var.services[count.index].name
    # image       = "${var.services[count.index].name}:latest"
    image       = docker_image.app[count.index].latest
    # domainname  = var.services[count.index].name

    networks_advanced {
        name    = docker_network.private_network.name
        aliases = [ var.services[count.index].name ]
    }

    ports {
        internal = var.services[count.index].appPort
        external = var.services[count.index].extPort
    }

    depends_on = [ docker_image.app ]
}