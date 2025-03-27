# Create VM Web1
resource "azurerm_linux_virtual_machine" "team3_web1" {
  name                  = "${var.name}-web1"
  resource_group_name   = azurerm_resource_group.team3_rg.name
  location              = azurerm_resource_group.team3_rg.location
  size                  = "Standard_F1s"
  admin_username        = var.name
  network_interface_ids = [azurerm_network_interface.team3_web1_nic.id]
  user_data             = base64encode(local.wdimage)

  admin_ssh_key {
    username   = var.name
    public_key = file("id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "9-lvm"
    version   = "9.3.20231113"
  }

  plan {
    publisher = "resf"
    product   = "rockylinux-x86_64"
    name      = "9-lvm"
  }
}

# Create VM Web2
resource "azurerm_linux_virtual_machine" "team3_web2" {
  name                  = "${var.name}-web2"
  resource_group_name   = azurerm_resource_group.team3_rg.name
  location              = azurerm_resource_group.team3_rg.location
  size                  = "Standard_F1s"
  admin_username        = var.name
  network_interface_ids = [azurerm_network_interface.team3_web2_nic.id]
  user_data             = base64encode(local.wd)

  admin_ssh_key {
    username   = var.name
    public_key = file("id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "9-lvm"
    version   = "9.3.20231113"
  }

  plan {
    publisher = "resf"
    product   = "rockylinux-x86_64"
    name      = "9-lvm"
  }
}
