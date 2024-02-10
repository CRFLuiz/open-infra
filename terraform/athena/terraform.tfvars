services = [
    {
        name        = "pegasus"
        context     = "/home/admin/open-infra/terraform/athena/pegasus"
        dockerfile  = "Dockerfile"
        appPort     = "3000"
        extPort     = "3000"
    }]

infrastructure = [
    {
        name        = "postgres"
        appPort     = "5432"
        extPort     = "3001"
        image       = "postgres:16.1-bullseye"
    }
]

newrelic_token = ""