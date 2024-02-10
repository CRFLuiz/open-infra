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
        image       = string
        appPort     = string
        extPort     = string
        env         = optional(list(string))
        volumes     = optional(list(object({
            container   = string
            host        = string
            read_only   = optional(string)
        })))
    }))
}

variable "newrelic_token" {
    type = string
}