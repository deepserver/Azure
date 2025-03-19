terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "lch_rg" {
  name     = "02-lch-rg"
  location = "Korea Central"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "lch_vnet" {
  name                = "lch-vnet"
  resource_group_name = azurerm_resource_group.lch_rg.name
  location            = azurerm_resource_group.lch_rg.location
  address_space       = ["10.0.0.0/16"]
}