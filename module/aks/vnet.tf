resource "azurerm_resource_group" "rg" {
  name     = var.rg_config.rg_name
  location = var.rg_config.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_config.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_config.address_space
}