resource "azurerm_dns_zone" "team3_dns" {
  name                = "semicolt.store"
  resource_group_name = azurerm_resource_group.team3_rg.name
}

resource "azurerm_dns_a_record" "team3_root_record" {
  name                = "@"
  resource_group_name = azurerm_resource_group.team3_rg.name
  zone_name           = azurerm_dns_zone.team3_dns.name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.team3_appgwip.id
}

resource "azurerm_dns_a_record" "team3_root_cname" {
  name                = "www"
  resource_group_name = azurerm_resource_group.team3_rg.name
  zone_name           = azurerm_dns_zone.team3_dns.name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.team3_appgwip.id
}

resource "azurerm_dns_ns_record" "team3_ns" {
  name                = "team3-ns"
  zone_name           = azurerm_dns_zone.team3_dns.name
  resource_group_name = azurerm_resource_group.team3_rg.name
  ttl                 = 300
  records             = ["ns1.semicolt.store"]
}

resource "azurerm_dns_ptr_record" "team3_ptr" {
  name                = "team3-ptr"
  zone_name           = azurerm_dns_zone.team3_dns.name
  resource_group_name = azurerm_resource_group.team3_rg.name
  ttl                 = 300
  records             = ["semicolt.store"]
}
