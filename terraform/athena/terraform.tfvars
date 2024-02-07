services = [
    {
        name        = "pegasus"
        context     = "/home/admin/open-infra/terraform/athena/pegasus"
        dockerfile  = "Dockerfile"
        appPort     = "3000"
        extPort     = "3000"
    }
]