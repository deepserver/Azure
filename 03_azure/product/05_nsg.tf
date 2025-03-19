resource "azurerm_network_security_group" "lch_bas_nsg" {
  name                = "lch-bas-nsg"
  location            = azurerm_resource_group.lch_rg.location
  resource_group_name = azurerm_resource_group.lch_rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "10.0.0.4"
    destination_port_range     = "22"
  }
  security_rule {
    name                       = "PING"
    priority                   = 220
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "*"
  }
  tags = {
    environment = "lch-bas-nsg"
  }
}

resource "azurerm_network_security_group" "lch_web_nsg" {
  name                = "lch-web-nsg"
  location            = azurerm_resource_group.lch_rg.location
  resource_group_name = azurerm_resource_group.lch_rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "10.0.0.4"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
    
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 210
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "10.0.0.0/16"
    destination_port_range     = "80"
  }
  security_rule {
    name                       = "PING"
    priority                   = 220
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "*"
  }  
  tags = {
    environment = "lch-web-nsg"
  }
}