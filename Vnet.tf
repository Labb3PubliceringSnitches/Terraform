resource "azurerm_virtual_network" "webappVnet" {
  name                = "web-app-vnet"
  location            = local.RGlocation
  resource_group_name = local.RGname
  address_space       = ["10.0.0.0/16"]
  
  depends_on = [ azurerm_resource_group.Snitches_RG ]
}

// SnitchesApp
resource "azurerm_subnet" "Snitch_App_AppsSubnet" {
  name                 = "S-APP-Apps-subnet"
  resource_group_name  = local.RGname
  virtual_network_name = azurerm_virtual_network.webappVnet.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [ azurerm_virtual_network.webappVnet ]
}

// Snitches_function_API
resource "azurerm_subnet" "Snitch_API_AppsSubnet" {
  name                 = "S-API-Apps-subnet"
  resource_group_name  = local.RGname
  virtual_network_name = azurerm_virtual_network.webappVnet.name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [ azurerm_virtual_network.webappVnet ]
}

// For APP
resource "azurerm_app_service_slot_virtual_network_swift_connection" "Stage_Subnet" {
  slot_name      = azurerm_linux_web_app_slot.webapp_snitches_Staging.name
  app_service_id = azurerm_linux_web_app.webapp_snitches.id      
  subnet_id      = azurerm_subnet.Snitch_App_AppsSubnet.id

  depends_on = [ azurerm_subnet.Snitch_App_AppsSubnet, azurerm_linux_web_app.webapp_snitches ]     
}