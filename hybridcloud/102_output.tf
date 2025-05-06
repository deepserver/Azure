# Check Public IP
output "Bastion_Public_IP" {
  value = azurerm_public_ip.team3_bastion_ip.ip_address
}

output "LB_Public_IP" {
  value = azurerm_public_ip.team3_appgwip.ip_address
}

output "VPN_Public_IP" {
  value = azurerm_public_ip.team3_vpnip.ip_address
}
