terraform{

backend "azurerm" {
    resource_group_name   = "Labb3-Snitches-RG"
    storage_account_name  = "snitchedstate"
    container_name        = "statecontainer"
    key                   = "terraform.tfstate"
}

}