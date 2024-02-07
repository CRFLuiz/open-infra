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
        port        = string
    }))
}

resource "docker_image" "ubuntu" {
    count   = length(var.services)
    name    = "${var.services[count.index].name}:latest"

    build {
        dockerfile  = var.services[count.index].dockerfile
        path        = var.services[count.index].context
    }
}

resource "docker_service" "service" {
    count = length(var.services)
    name = var.services[count.index].name

    task_spec {
        container_spec {
            image = "${var.services[count.index].name}:latest"
        }
    }

  endpoint_spec {
    ports {
      target_port = var.services[count.index].port
    }
  }
}