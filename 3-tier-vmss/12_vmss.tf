# Create VMSS
resource "azurerm_linux_virtual_machine_scale_set" "team3_vmss" {
  name                = "${var.name}-vmss"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  upgrade_mode        = "Manual"
  sku                 = "Standard_F1s"
  instances           = 2
  admin_username      = var.name
  
  source_image_id = azurerm_shared_image_version.team3_version.id

  plan {
    name      = "9-lvm"
    publisher = "resf"
    product   = "rockylinux-x86_64"
  }

  admin_ssh_key {
    username   = var.name
    public_key = file("id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  network_interface {
    name    = "${var.name}-vmss-nic"
    primary = true

    ip_configuration {
      name                                         = "${var.name}-nic"
      primary                                      = true
      subnet_id                                    = azurerm_subnet.team3_auto.id
      application_gateway_backend_address_pool_ids = [one(azurerm_application_gateway.team3_appgw.backend_address_pool[*].id)]
    }
  }

  depends_on = [azurerm_shared_image_version.team3_version]
}


