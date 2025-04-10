# Public IP for Bastion VM
resource "azurerm_public_ip" "team3_bastion_ip" {
  name                = "${var.name}-bastion-ip"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Public IP for NAT Gateway
resource "azurerm_public_ip" "team3_nat_ip" {
  name                = "${var.name}-nat-ip"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Public IP for Load Balancer
resource "azurerm_public_ip" "team3_appgwip" {
  name                = "${var.name}-lb-ip"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Public IP for VNetGW
resource "azurerm_public_ip" "team3_vpnip" {
  name                = "${var.name}-vpn-ip"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}
