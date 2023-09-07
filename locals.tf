locals {
  RGname = azurerm_resource_group.Snitches_RG.name
  RGlocation = azurerm_resource_group.Snitches_RG.location
  FA_KEY  = data.azurerm_function_app_host_keys.FA_KEY.default_function_key
}