# Network Security Group for Bastion
resource "azurerm_network_security_group" "team3_bastion_nsg" {
  name                = "${var.name}-bat-nsg"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name
  # Bastion SSH Allow Rule
  security_rule {
    name                       = "Allow-SSH-From-Host"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.local_public_ip
    destination_address_prefix = var.bastion_ip
  }
  security_rule {
    name                       = "Allow-Ping"
    priority                   = 205
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Network Security Group for Internal Network
resource "azurerm_network_security_group" "team3_web_nsg" {
  name                = "${var.name}-web-nsg"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name
  # Web SSH Allow Rule
  security_rule {
    name                       = "Allow-SSH-From-Bastion"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.bastion_ip
    destination_address_prefix = "*"
  }
  # Ping Allow Rule
  security_rule {
    name                       = "Allow-Ping"
    priority                   = 205
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  # Web Http Allow Rule
  security_rule {
    name                       = "Allow-HTTP-From-All"
    priority                   = 210
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  # DB Allow Rule
  security_rule {
    name                       = "Allow-MySQL-To-DB"
    priority                   = 220
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "*"
    destination_address_prefix = var.DB_ip
  }
}
