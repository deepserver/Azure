resource "azurerm_lb" "lch_lb" {
  name                = "lch-lb"
  location            = azurerm_resource_group.lch_rg.location
  resource_group_name = azurerm_resource_group.lch_rg.name
  sku = "Standard"
  sku_tier = "Regional"

  frontend_ip_configuration {
    name                 = "lch-lb-ip"
    public_ip_address_id = azurerm_public_ip.lch_lb_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lch_lb_back" {
  loadbalancer_id = azurerm_lb.lch_lb.id
  name            = "lch-lb-back"
}
resource "azurerm_lb_backend_address_pool_address" "lch_lb_back_address_web1" {
  name                    = "lch-lb-back-address_web1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lch_lb_back.id
  virtual_network_id      = azurerm_virtual_network.lch_vnet.id
  ip_address              = "10.0.3.4"
}
resource "azurerm_lb_backend_address_pool_address" "lch_lb_back_address_web2" {
  name                    = "lch-lb-back-address_web2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lch_lb_back.id
  virtual_network_id      = azurerm_virtual_network.lch_vnet.id
  ip_address              = "10.0.4.4"
}

resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.lch_lb.id
  name                           = "lch-lb-inboundrule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_public_ip.lch_lb_ip.name
}