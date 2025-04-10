# Create Resource Group
resource "azurerm_resource_group" "team3_rg" {
  name     = "02-${var.name}-rg"
  location = var.location
}
