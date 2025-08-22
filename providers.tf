provider "azurerm" {
    features {}
}

# Data source for tenant id 
data "azurerm_client_config" "assignment" {}