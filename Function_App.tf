resource "azurerm_windows_function_app" "polisapi" {
  name                = "polisapi-functions"
  resource_group_name = local.RGname
  location            = local.RGlocation

  storage_account_name       = azurerm_storage_account.Function_storage.name
  storage_account_access_key = azurerm_storage_account.Function_storage.primary_access_key
  service_plan_id            = azurerm_service_plan.function_plan.id

  site_config {}

  depends_on = [ azurerm_service_plan.function_plan,
                 azurerm_storage_account.PolisAPI_FA_SA]

}

resource "azurerm_service_plan" "PolisAPI_ASP" {
  name                = "polisapi-asp"
  location            = local.RGlocation
  resource_group_name = local.RGname
  os_type             = "Windows"
  sku_name            = "Y1"
  depends_on = [ azurerm_resource_group.Snitches_RG ]
}

resource "azurerm_storage_account" "Function_storage" {
  name                     = "snitchedfunctionsa"
  resource_group_name      = local.RGname
  location                 = local.RGlocation
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "LRS"

  depends_on = [ azurerm_resource_group.Snitches_RG ]
}

resource "azurerm_app_service_source_control" "Source_Code" {
  app_id   = azurerm_windows_function_app.polisapi.id
  repo_url = "https://github.com/IamFrampt/Labb2PolisFunctionApp.git"
  branch   = "master"
  depends_on = [ azurerm_windows_function_app.PolisApi_Function,
                 azurerm_app_service_source_control_token.token ]
}
# Function key¨

data "azurerm_function_app_host_keys" "FA_KEY" {
  name                = "polisapi-functions"
  resource_group_name = local.RGname

  depends_on = [ azurerm_resource_group.Snitches_RG,
                 azurerm_windows_function_app.polisapi]
}
