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
  subscription_id = "${{secrets.AZURE_SUB_ID}}"
  tenant_id = "${{secrets.AZURE_TENANT}}"
  client_id = "${{secrets.AZURE_CLIENT_ID}}"
  client_secret = "${{secrets.AZURE_CLIENT_SECRET}}"

  features {
     key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}