# Create Virtual Network
resource "azurerm_virtual_network" "team3_vnet" {
  name                = "${var.name}-vnet"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  address_space       = ["10.0.0.0/16"]
}

# Create Public Subnet for Bastion
resource "azurerm_subnet" "team3_bastion" {
  name                 = "${var.name}-bastion"
  resource_group_name  = azurerm_resource_group.team3_rg.name
  virtual_network_name = azurerm_virtual_network.team3_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

# Create Load Subnet
resource "azurerm_subnet" "team3_load" {
  name                 = "${var.name}-load"
  resource_group_name  = azurerm_resource_group.team3_rg.name
  virtual_network_name = azurerm_virtual_network.team3_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create NAT Subnet
resource "azurerm_subnet" "team3_nat" {
  name                 = "${var.name}-nat"
  resource_group_name  = azurerm_resource_group.team3_rg.name
  virtual_network_name = azurerm_virtual_network.team3_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
# Create Web1 Subnet
resource "azurerm_subnet" "team3_web1" {
  name                 = "${var.name}-web1"
  resource_group_name  = azurerm_resource_group.team3_rg.name
  virtual_network_name = azurerm_virtual_network.team3_vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

# Create Web2 Subnet
resource "azurerm_subnet" "team3_web2" {
  name                 = "${var.name}-web2"
  resource_group_name  = azurerm_resource_group.team3_rg.name
  virtual_network_name = azurerm_virtual_network.team3_vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}

# Create VPN Subnet
resource "azurerm_subnet" "team3_vnetgw" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.team3_rg.name
  virtual_network_name = azurerm_virtual_network.team3_vnet.name
  address_prefixes     = ["10.0.5.0/24"]
}
