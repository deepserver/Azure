resource "azurerm_nat_gateway" "lch_ng" {
  name                    = "lch-ng"
  location                = azurerm_resource_group.lch_rg.location
  resource_group_name     = azurerm_resource_group.lch_rg.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 4
# zones                   = NO ZONE
}

