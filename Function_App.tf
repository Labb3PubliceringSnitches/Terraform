resource "azurerm_storage_account" "Function_storage" {
  name                     = "snitchedfunctionsa"
  resource_group_name      = local.RGname
  location                 = local.RGlocation
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [ azurerm_resource_group.Snitches_RG ]
}

resource "azurerm_app_service_plan" "function_plan" {
  name                = "api-functions-service-plan"
  location            = local.RGlocation
  resource_group_name = local.RGname
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

  depends_on = [ azurerm_resource_group.Snitches_RG ]
}

resource "azurerm_function_app" "polisapi" {
  name                       = "polisapi-functions"
  location                   = local.RGlocation
  resource_group_name        = local.RGname
  app_service_plan_id        = azurerm_app_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.Function_storage.name
  storage_account_access_key = azurerm_storage_account.Function_storage.primary_access_key
}