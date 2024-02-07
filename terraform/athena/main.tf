module "docker" {
    source      = "../modules/docker"
    services    = var.services
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
    default     = [
        {
            name        = "pegasus"
            context     = "/home/admin/open-infra/terraform/athena/pegasus"
            dockerfile  = "Dockerfile"
            appPort     = "3000"
            extPort     = "3001"
        },
        {
            name        = "seya"
            context     = "/home/admin/open-infra/terraform/athena/pegasus"
            dockerfile  = "Dockerfile"
            appPort     = "3000"
            extPort     = "3002"
        }
    ]
}

