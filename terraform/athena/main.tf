module "docker" {
    source      = "../modules/docker"
    services    = var.services
}