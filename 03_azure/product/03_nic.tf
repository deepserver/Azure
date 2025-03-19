resource "azurerm_network_interface" "lch_bas_nic" {
  name                = "bas-nic"
  location            = azurerm_resource_group.lch_rg.location
  resource_group_name = azurerm_resource_group.lch_rg.name

  ip_configuration {
    name                          = "lch-bas-ip"
    subnet_id                     = azurerm_subnet.lch_bas.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.4"
    public_ip_address_id          = azurerm_public_ip.lch_bas_ip.id
  }
}
resource "azurerm_network_interface" "lch_web1_nic" {
  name                = "web1-nic"
  location            = azurerm_resource_group.lch_rg.location
  resource_group_name = azurerm_resource_group.lch_rg.name

  ip_configuration {
    name                          = "lch-web1-ip"
    subnet_id                     = azurerm_subnet.lch_web1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = null
  }
}
resource "azurerm_network_interface" "lch_web2_nic" {
  name                = "web2-nic"
  location            = azurerm_resource_group.lch_rg.location
  resource_group_name = azurerm_resource_group.lch_rg.name

  ip_configuration {
    name                          = "lch-web2-ip"
    subnet_id                     = azurerm_subnet.lch_web2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = null
  }
}

