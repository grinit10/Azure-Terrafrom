resource "azurerm_resource_group" "rg" {
  name     = var.resource-group-name
  location = "australiasoutheast"
  tags = {
    env = var.environment-value
  }
}
