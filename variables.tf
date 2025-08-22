variable "env" {
    description = "Environment tag. Allowed: dev, qa, stg, prd"
    type = string
    
    validation {
        condition = contains(["dev", "qa", "stg", "prd"], var.env)
        error_message = "env must be one of: dev, qa, stg, prd."
        }
}

variable "common_tags" {
    description = "Additional tags applied to all resources. 'env' will be added automatically."
    type = map(string)
    default = {}
}
