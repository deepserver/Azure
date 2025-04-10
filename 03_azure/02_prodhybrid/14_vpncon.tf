resource "azurerm_virtual_network_gateway_connection" "team3_vpn_connection" {
  name                = "${var.name}-vpn-connection"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.team3_vpn.id
  local_network_gateway_id   = azurerm_local_network_gateway.team3_home.id

  shared_key = "It12345!"

  ipsec_policy {
    dh_group         = "DHGroup2"
    ike_encryption   = "AES256"
    ike_integrity    = "SHA256"
    ipsec_encryption = "AES256"
    ipsec_integrity  = "SHA256"
    pfs_group        = "PFS2"
    sa_lifetime      = 3600
    sa_datasize      = 2147483647
  }
}
