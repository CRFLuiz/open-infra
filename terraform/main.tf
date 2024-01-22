terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = file("./dotoken")
}

resource "digitalocean_kubernetes_cluster" "my_cluster" {
  name    = "open-infra-cluster"
  region  = "nyc1"
  version = "1.29.0-do.0"

  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}

resource "digitalocean_project" "project" {
  name        = "openinfra-${terraform.workspace}"
  description = "Open infra for ${terraform.workspace} workspace"
  purpose     = "Tests"
}

resource "digitalocean_project_resources" "project_resources" {
  project = digitalocean_project.project.id
  resources = [
    digitalocean_kubernetes_cluster.my_cluster.urn
  ]
}