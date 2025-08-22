############################
# Resource Groups 
############################
 
resource "azurerm_resource_group" "rg_canada_east" {
    name = "rg-ce-rogers-task1"
    location = "Canada East"
    tags = merge(var.common_tags, { env = var.env }) 
}


resource "azurerm_resource_group" "rg_canada_central" {
    name = "rg-cc-rogers-task2"
    location = "Canada Central"
    tags = merge(var.common_tags, { env = var.env })
}


################################
# Key Vault (Canada East)
################################
module "kv_canada_east" {
    source = "./modules/key_vault"
    name = "kv-${var.env}-ce-001"
    location = azurerm_resource_group.rg_canada_east.location
    resource_group_name = azurerm_resource_group.rg_canada_east.name
   
    tenant_id = data.azurerm_client_config.assignment.tenant_id   
    public_network_access_enabled = false
    soft_delete_retention_days = 7

    env = var.env
    extra_tags = var.common_tags
}


################################
# Storage Account #1 (LRS, Canada Central, public access disabled)
################################
module "sa_canada_central_lrs" {
    source = "./modules/storage_account"
    name = "sa-${var.env}cc-001"  
    location = azurerm_resource_group.rg_canada_central.location
    resource_group_name = azurerm_resource_group.rg_canada_central.name

    account_replication_type = "LRS"
    public_network_access_enabled = false

    env = var.env
    extra_tags = var.common_tags
}


################################
# Storage Account #2 (RA-GRS, Canada East, public access enabled)
################################
module "sa_canada_east_ragrs" {
    source = "./modules/storage_account"
    name = "sa-${var.env}ce-001" 
    location = azurerm_resource_group.rg_canada_east.location
    resource_group_name = azurerm_resource_group.rg_canada_east.name

    account_replication_type = "RAGRS"
    public_network_access_enabled = true

    env = var.env
    extra_tags = var.common_tags
}