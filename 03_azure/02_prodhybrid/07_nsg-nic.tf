# Bastion NIC <-> NSG
resource "azurerm_network_interface_security_group_association" "team3_bat_nic_nsgasso" {
  network_interface_id      = azurerm_network_interface.team3_bat_nic.id
  network_security_group_id = azurerm_network_security_group.team3_bastion_nsg.id
}

# Web NIC <-> NSG 
resource "azurerm_network_interface_security_group_association" "team3_web1_nic_nsgasso" {
  network_interface_id      = azurerm_network_interface.team3_web1_nic.id
  network_security_group_id = azurerm_network_security_group.team3_web_nsg.id
}

resource "azurerm_network_interface_security_group_association" "team3_web2_nic_nsgasso" {
  network_interface_id      = azurerm_network_interface.team3_web2_nic.id
  network_security_group_id = azurerm_network_security_group.team3_web_nsg.id
}


