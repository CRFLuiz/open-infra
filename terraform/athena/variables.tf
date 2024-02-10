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

variable "infrastructure" {
    description = ""
    type        = list(object({
        name        = string
        appPort     = string
        extPort     = string
        image       = string
    }))
}

variable "newrelic_token" {
    type = string
}