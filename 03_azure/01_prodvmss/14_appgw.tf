# Create Application Gateway
resource "azurerm_application_gateway" "team3_appgw" {
  name                = "${var.name}-appgw"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location

  sku {
    name     = "Basic"
    tier     = "Basic"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "${var.name}-gateway-ip-configuration"
    subnet_id = azurerm_subnet.team3_load.id
  }
  # For HTTP Service
  frontend_port {
    name = var.frontend_port_name
    port = 80
  }
  # Attachment Public IP
  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.team3_appgwip.id
  }
  # Backend IP Setting
  backend_address_pool {
    name         = var.backend_address_pool_name
    ip_addresses = ["10.0.4.4"]
  }

  backend_http_settings {
    name                  = var.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = var.listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = var.listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.http_setting_name
    priority                   = 100
  }
}


