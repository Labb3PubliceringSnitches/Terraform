
resource "azurerm_cosmosdb_account" "db" {
  name                = "snitchesdb"
  location            = azurerm_resource_group.Snitches_RG.location
  resource_group_name = azurerm_resource_group.Snitches_RG.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "Session"

  }

  geo_location {
    location = azurerm_resource_group.Snitches_RG.location
    failover_priority = 0
  }
}