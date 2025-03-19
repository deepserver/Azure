resource "azurerm_subnet_nat_gateway_association" "lch_ngsubasso_web1" {
  subnet_id      = azurerm_subnet.lch_web1.id
  nat_gateway_id = azurerm_nat_gateway.lch_ng.id
}
resource "azurerm_subnet_nat_gateway_association" "lch_ngsubasso_web2" {
  subnet_id      = azurerm_subnet.lch_web2.id
  nat_gateway_id = azurerm_nat_gateway.lch_ng.id
}
resource "azurerm_subnet_nat_gateway_association" "lch_ngsubasso_nat" {
  subnet_id      = azurerm_subnet.lch_nat.id
  nat_gateway_id = azurerm_nat_gateway.lch_ng.id
}
