# Create Bastion VM 
resource "azurerm_linux_virtual_machine" "team3_bastion" {
  name                       = "${var.name}-bastion"
  resource_group_name        = azurerm_resource_group.team3_rg.name
  location                   = azurerm_resource_group.team3_rg.location
  size                       = "Standard_F1s"
  admin_username             = var.name
  network_interface_ids      = [azurerm_network_interface.team3_bat_nic.id]
  user_data                  = base64encode(local.id_rsa)
  provision_vm_agent         = true
  allow_extension_operations = true

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

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [identity]
  }
}
/*
resource "azurerm_virtual_machine_extension" "team3_bastion_extension" {
  name                       = "AzurePolicyforLinux"
  virtual_machine_id         = azurerm_linux_virtual_machine.team3_bastion.id
  publisher                  = "Microsoft.GuestConfiguration.DependencyAgent"
  type                       = "ConfigurationforLinux"
  type_handler_version       = "1.26.89"
  auto_upgrade_minor_version = true
}
*/
