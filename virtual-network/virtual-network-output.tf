output "default_subnet_id" {
  value = azurerm_subnet.default.id
}

output "webSubnet_subnet_id" {
  value = azurerm_subnet.webSubnet.id
}

output "webSubnet_nic_id" {
  value = azurerm_network_interface.nic.id
}