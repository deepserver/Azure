resource "azurerm_nat_gateway_public_ip_association" "lch_ngipasso" {
  nat_gateway_id       = azurerm_nat_gateway.lch_ng.id
  public_ip_address_id = azurerm_public_ip.lch_ng.id
}