resource "azurerm_storage_account" "storage_task" {
  name                     = var.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  public_network_access_enabled = var.public_network_access_enabled 

  tags = merge(var.extra_tags, { env = var.env })
}