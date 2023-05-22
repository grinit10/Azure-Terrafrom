terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "resource-group" {
  source = "./resource-group"
  environment-value = var.environment-value
  resource-group-name = var.resource-group-name
}

module "storage_accnt" {
  source = "./storage-account"
  environment-value = var.environment-value
  resource-group-name = module.resource-group.resource_group_name
  storage-account-name = var.storage-account-name
}

module "virtual-network" {
  source = "./virtual-network"
  environment-value = var.environment-value
  resource-group-name = module.resource-group.resource_group_name
  resource-group-location = module.resource-group.resource_group_location
  virtual-network-name = var.virtual-network-name
}