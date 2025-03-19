resource "azurerm_subnet" "lch_bas" {
  name                 = "lch-bas"
  resource_group_name  = azurerm_resource_group.lch_rg.name
  virtual_network_name = azurerm_virtual_network.lch_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}
resource "azurerm_subnet" "lch_nat" {
  name                 = "lch-nat"
  resource_group_name  = azurerm_resource_group.lch_rg.name
  virtual_network_name = azurerm_virtual_network.lch_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_subnet" "lch_load" {
  name                 = "lch-load"
  resource_group_name  = azurerm_resource_group.lch_rg.name
  virtual_network_name = azurerm_virtual_network.lch_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_subnet" "lch_web1" {
  name                 = "lch-web1"
  resource_group_name  = azurerm_resource_group.lch_rg.name
  virtual_network_name = azurerm_virtual_network.lch_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}
resource "azurerm_subnet" "lch_web2" {
  name                 = "lch-web2"
  resource_group_name  = azurerm_resource_group.lch_rg.name
  virtual_network_name = azurerm_virtual_network.lch_vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}
resource "azurerm_subnet" "lch_db" {
  name                 = "lch-db"
  resource_group_name  = azurerm_resource_group.lch_rg.name
  virtual_network_name = azurerm_virtual_network.lch_vnet.name
  address_prefixes     = ["10.0.5.0/24"]
}


