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