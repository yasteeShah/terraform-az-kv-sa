variable "name" {
  description = "Storage account name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "account_tier" {
  description = "Account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type (e.g., LRS, GRS, RAGRS, ZRS)"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Whether to allow public blob access at account scope"
  type        = bool
  default     = false
}

variable "env" {
  description = "Environment tag"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "stg", "prd"], var.env)
    error_message = "env must be one of: dev, qa, stg, prd."
  }
}

variable "extra_tags" {
  description = "Additional tags to merge with env tag"
  type        = map(string)
  default     = {}
}