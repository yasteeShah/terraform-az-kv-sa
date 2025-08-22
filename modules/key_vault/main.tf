resource "azurerm_key_vault" "kv_task1" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name

  # Public network access
  public_network_access_enabled = var.public_network_access_enabled

  # Soft delete retention days
  soft_delete_retention_days = var.soft_delete_retention_days

  tags = merge(var.extra_tags, { env = var.env })
}