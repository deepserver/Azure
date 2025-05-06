# DNS Zone for MySQL
resource "azurerm_private_dns_zone" "team3_pridns" {
  name                = "${var.name}.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.team3_rg.name
}

# DNS zone Virtual Network Links
resource "azurerm_private_dns_zone_virtual_network_link" "team3_dns_link" {
  name                  = "${var.name}-pridns-vnetzone.com"
  resource_group_name   = azurerm_resource_group.team3_rg.name
  virtual_network_id    = azurerm_virtual_network.team3_vnet.id
  private_dns_zone_name = azurerm_private_dns_zone.team3_pridns.name
}

# Create MySQL Server
resource "azurerm_mysql_flexible_server" "team3_mysql" {
  name                         = "${var.name}-mysql"
  resource_group_name          = azurerm_resource_group.team3_rg.name
  location                     = azurerm_resource_group.team3_rg.location
  administrator_login          = var.name
  administrator_password       = var.password
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  sku_name                     = "B_Standard_B1ms"
  version                      = "8.0.21"

  lifecycle {
    ignore_changes = [
      zone,
    ]
  }
}

# Create Private Endpoint
resource "azurerm_private_endpoint" "team3_mysql_ep" {
  name                = "${var.name}-mysql-ep"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  subnet_id           = azurerm_subnet.team3_db.id

  private_service_connection {
    name                           = "mysql"
    private_connection_resource_id = azurerm_mysql_flexible_server.team3_mysql.id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "${var.name}-mysql-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.team3_pridns.id]
  }
}

# Create Database Name "wordpress"
resource "azurerm_mysql_flexible_database" "team3_db" {
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
  name                = "wordpress"
  resource_group_name = azurerm_resource_group.team3_rg.name
  server_name         = azurerm_mysql_flexible_server.team3_mysql.name
}

# Change Parameter
resource "azurerm_mysql_flexible_server_configuration" "team3_mysql_config" {
  name                = "require_secure_transport"
  resource_group_name = azurerm_resource_group.team3_rg.name
  server_name         = azurerm_mysql_flexible_server.team3_mysql.name
  value               = "OFF"
}
