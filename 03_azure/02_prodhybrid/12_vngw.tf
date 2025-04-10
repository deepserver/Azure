resource "azurerm_virtual_network_gateway" "team3_vpn" {
  name                = "${var.name}-vpn"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"
  generation    = "Generation1"

  ip_configuration {
    name                          = "${var.name}-vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.team3_vpnip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.team3_vnetgw.id
  }
}
