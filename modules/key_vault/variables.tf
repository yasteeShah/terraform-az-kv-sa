variable "name" {
  description = "Key Vault name"
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

variable "tenant_id" {
  description = "Tenant id for the Key Vault"
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU"
  type        = string
  default     = "standard"
}

variable "public_network_access_enabled" {
  description = "If false, disables public network access"
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention period in days (7-90)"
  type        = number
  default     = 7
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