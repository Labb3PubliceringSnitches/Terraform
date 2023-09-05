# terraform {
#   backend "azurerm" {
#     resource_group_name   = data.local.RGname
#     storage_account_name  = data.azurerm_storage_account.TFSTATESTORAGE.storage_account_name
#     container_name        = "statecontainer"
#     key                   = "terraform.tfstate"
#     tenant_id             = var.AZURE_TENANT_ID_SECRET
#   }
# }