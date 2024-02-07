module "docker" {
    source      = "../modules/docker"
    services    = [{
        name        = "pegasus"
        context     = "./pegasus"
        dockerfile  = "./Dockerfile"
        port        = "3000"
    }]
}