resource "azurerm_storage_account" "Function_storage" {
  name                     = "snitchedfunctionsa"
  resource_group_name      = local.RGname
  location                 = local.RGlocation
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "LRS"

  depends_on = [ azurerm_resource_group.Snitches_RG ]
}

resource "azurerm_service_plan" "function_plan" {
  name                = "api-functions-service-plan"
  location            = local.RGlocation
  resource_group_name = local.RGname
  os_type             = "Linux"
  sku_name            = "Y1"

  depends_on = [ azurerm_resource_group.Snitches_RG ]
}

resource "azurerm_linux_function_app" "polisapi" {
  name                       = "polisapi-functions"
  location                   = local.RGlocation
  resource_group_name        = local.RGname
  service_plan_id            = azurerm_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.Function_storage.name
  storage_account_access_key = azurerm_storage_account.Function_storage.primary_access_key

  site_config { }

  depends_on = [ azurerm_service_plan.function_plan,
                 azurerm_storage_account.Function_storage]
}

resource "azurerm_app_service_source_control" "FA_CODE" {
  app_id   = azurerm_linux_function_app.polisapi.id
  repo_url = "https://github.com/Labb3PubliceringSnitches/PolisappAPI.git"
  branch   = "main"
  depends_on = [ azurerm_linux_function_app.polisapi,
                 azurerm_app_service_source_control_token.token ]
}

data "azurerm_function_app_host_keys" "FA_KEY" {
  name                = "polisapi-functions"
  resource_group_name = local.RGname

  depends_on = [ azurerm_resource_group.Snitches_RG,
                 azurerm_linux_function_app.polisapi]
}
