resource "azurerm_linux_virtual_machine" "lch_bas_vm" {
  name                  = "lch-bas-vm"
  location              = azurerm_resource_group.lch_rg.location
  resource_group_name   = azurerm_resource_group.lch_rg.name
  admin_username        = "lch"
  network_interface_ids = [azurerm_network_interface.lch_bas_nic.id]
  size                  = "Standard_F1s"

  admin_ssh_key {
    username   = "lch"
    public_key = file("./id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "8-lvm"
    version   = "latest"
  }
  plan {
    name      = "8-lvm"
    product   = "rockylinux-x86_64"
    publisher = "resf"
  }
}

resource "azurerm_linux_virtual_machine" "lch_web1_vm" {
  name                  = "lch-web1-vm"
  location              = azurerm_resource_group.lch_rg.location
  resource_group_name   = azurerm_resource_group.lch_rg.name
  admin_username        = "lch"
  network_interface_ids = [azurerm_network_interface.lch_web1_nic.id]
  size                  = "Standard_F1s"

  admin_ssh_key {
    username   = "lch"
    public_key = file("./id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "8-lvm"
    version   = "latest"
  }
  plan {
    name      = "8-lvm"
    product   = "rockylinux-x86_64"
    publisher = "resf"
  }
}

resource "azurerm_linux_virtual_machine" "lch_web2_vm" {
  name                  = "lch-web2-vm"
  location              = azurerm_resource_group.lch_rg.location
  resource_group_name   = azurerm_resource_group.lch_rg.name
  admin_username        = "lch"
  network_interface_ids = [azurerm_network_interface.lch_web2_nic.id]
  size                  = "Standard_F1s"

  admin_ssh_key {
    username   = "lch"
    public_key = file("./id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "8-lvm"
    version   = "latest"
  }
  plan {
    name      = "8-lvm"
    product   = "rockylinux-x86_64"
    publisher = "resf"
  }
}
