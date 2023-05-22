resource "azurerm_virtual_network" "vnet" {
  name                     = var.virtual-network-name
  resource_group_name      = var.resource-group-name
  location                 = var.resource-group-location
  address_space            = ["10.0.0.0/16"]
  subnet {
    name           = "default"
    address_prefix = "10.0.0.0/24"
  }

  tags = {
    env = var.environment-value
  }
}