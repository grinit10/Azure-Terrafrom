resource "azurerm_virtual_network" "vnet" {
  name                     = var.virtual-network-name
  resource_group_name      = var.resource-group-name
  location                 = var.resource-group-location
  address_space            = ["10.0.0.0/16"]
  tags = {
    env = var.environment-value
  }
}

resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = var.resource-group-name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "webSubnet" {
  name                 = "webSubnet"
  resource_group_name  = var.resource-group-name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "testnic"
  location            = var.resource-group-location
  resource_group_name = var.resource-group-name

  ip_configuration {
    name                          = "testconfiguration"
    subnet_id                     = azurerm_subnet.webSubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}