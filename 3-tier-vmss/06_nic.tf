# Network Interface Card for Bastion VM
resource "azurerm_network_interface" "team3_bat_nic" {
  name                = "${var.name}-bat-nic"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name

  ip_configuration {
    name                          = "${var.name}-bat-ip"
    subnet_id                     = azurerm_subnet.team3_bastion.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.bastion_ip
    public_ip_address_id          = azurerm_public_ip.team3_bastion_ip.id
  }
}

# Network Interface Card for Web1
resource "azurerm_network_interface" "team3_web1_nic" {
  name                = "${var.name}-web1-nic"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name

  ip_configuration {
    name                          = "${var.name}-web1-ip"
    subnet_id                     = azurerm_subnet.team3_web1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.3.4"
  }
}

# Network Interface Card for Web2
resource "azurerm_network_interface" "team3_web2_nic" {
  name                = "${var.name}-web2-nic"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name

  ip_configuration {
    name                          = "${var.name}-web2-ip"
    subnet_id                     = azurerm_subnet.team3_web2.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.4.4"
  }
}
