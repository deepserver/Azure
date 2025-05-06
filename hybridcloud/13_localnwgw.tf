resource "azurerm_local_network_gateway" "team3_home" {
  name                = "${var.name}-backhome"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  gateway_address     = "1.220.76.5"
  address_space       = ["10.10.5.0/24"]
}
