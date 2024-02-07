module "docker" {
    source      = "../modules/docker"
    services    = var.services
    newrelic_token = var.newrelic_token
}