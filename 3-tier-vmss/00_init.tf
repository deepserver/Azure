terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.23"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subid
  features {}
}
