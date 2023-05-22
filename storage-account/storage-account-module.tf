resource "azurerm_storage_account" "stg_accnt" {
  name                     = var.storage-account-name
  resource_group_name      = var.resource-group-name
  location                 = "australiasoutheast"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    env = var.environment-value
  }
}