terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = var.AZURE_SUB_ID_SECRET
  tenant_id = var.AZURE_TENANT_ID_SECRET
  client_id = var.AZURE_CLIENT_ID_SECRET
  client_secret = var.AZURE_CLIENT_SECRET_SECRET

  features {
     key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
