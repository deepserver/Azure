# Create VM Ftp
resource "azurerm_linux_virtual_machine" "team3_ftp" {
  name                  = "${var.name}-ftp"
  resource_group_name   = azurerm_resource_group.team3_rg.name
  location              = azurerm_resource_group.team3_rg.location
  size                  = "Standard_F1s"
  admin_username        = var.name
  network_interface_ids = [azurerm_network_interface.team3_ftp_nic.id]
  user_data             = base64encode(local.ftp)

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

  provision_vm_agent         = true
  allow_extension_operations = true

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [identity]
  }
}
