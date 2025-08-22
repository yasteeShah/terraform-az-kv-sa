terraform {
    required_version = ">= 1.13.0"

    required_providers {
        azurerm = {
          source = "hashicorp/azurerm"
          version = ">= 3.112.0"
          }
    }
}

