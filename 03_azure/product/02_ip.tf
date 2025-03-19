resource "azurerm_public_ip" "lch_bas_ip" {
  name                = "lch-bas-ip"
  resource_group_name = azurerm_resource_group.lch_rg.name
  location            = azurerm_resource_group.lch_rg.location
  allocation_method   = "Static"
  tags = {
    environment = "lch-bas-ip"
  }
}
resource "azurerm_public_ip" "lch_ng_ip" {
  name                = "lch-ng-ip"
  resource_group_name = azurerm_resource_group.lch_rg.name
  location            = azurerm_resource_group.lch_rg.location
  allocation_method   = "Static"
  sku = "Standard"
  tags = {
    environment = "lch-ng-ip"
  }
}
resource "azurerm_public_ip" "lch_lb_ip" {
  name                = "lch-lb-ip"
  resource_group_name = azurerm_resource_group.lch_rg.name
  location            = azurerm_resource_group.lch_rg.location
  allocation_method   = "Static"
  tags = {
    environment = "lch-lb-ip"
  }
}