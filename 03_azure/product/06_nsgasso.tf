resource "azurerm_network_interface_security_group_association" "lch_bas_nsg_asso" {
  network_interface_id      = azurerm_network_interface.lch_bas_nic.id
  network_security_group_id = azurerm_network_security_group.lch_bas_nsg.id
}
resource "azurerm_network_interface_security_group_association" "lch_web1_nsg_asso" {
  network_interface_id      = azurerm_network_interface.lch_web1_nic.id
  network_security_group_id = azurerm_network_security_group.lch_web_nsg.id
}
resource "azurerm_network_interface_security_group_association" "lch_web2_nsg_asso" {
  network_interface_id      = azurerm_network_interface.lch_web2_nic.id
  network_security_group_id = azurerm_network_security_group.lch_web_nsg.id
}