resource "azurerm_resource_group" "Snitches_RG"{
    name = "Labb3-Snitches-RG"
    location = "West Europe"

    count = var.create_resource_group ? 1 : 0
}