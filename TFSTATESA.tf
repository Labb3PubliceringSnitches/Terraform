resource "azurerm_storage_account" "TFSTATESTORAGE" {
  name                     = "snitchedstate"
  resource_group_name      = local.RGname
  location                 = local.RGlocation
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [ azurerm_resource_group.Snitches_RG ]
}
