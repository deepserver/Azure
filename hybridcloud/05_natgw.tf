# Create NAT Gateway
resource "azurerm_nat_gateway" "team3_natgw" {
  name                = "${var.name}-natgw"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name
}
# NAT Gateway Association

resource "azurerm_subnet_nat_gateway_association" "team3_web1_nat" {
  subnet_id      = azurerm_subnet.team3_web1.id
  nat_gateway_id = azurerm_nat_gateway.team3_natgw.id
}

resource "azurerm_subnet_nat_gateway_association" "team3_web2_nat" {
  subnet_id      = azurerm_subnet.team3_web2.id
  nat_gateway_id = azurerm_nat_gateway.team3_natgw.id
}

# Attachment Public IP -> NAT Gateway
resource "azurerm_nat_gateway_public_ip_association" "team3_natgwp_pubip" {
  nat_gateway_id       = azurerm_nat_gateway.team3_natgw.id
  public_ip_address_id = azurerm_public_ip.team3_nat_ip.id
}
