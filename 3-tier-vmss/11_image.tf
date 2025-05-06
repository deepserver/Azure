resource "azurerm_image" "team3_image" {
  name                      = "${var.name}-image"
  resource_group_name       = azurerm_resource_group.team3_rg.name
  location                  = azurerm_resource_group.team3_rg.location
  source_virtual_machine_id = azurerm_linux_virtual_machine.team3_web1.id
  hyper_v_generation        = "V2"

  depends_on = [null_resource.gen_web1]
}

resource "azurerm_shared_image_gallery" "team3_gallery" {
  name                = "${var.name}gallery"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location

  depends_on = [azurerm_image.team3_image]
}

resource "azurerm_shared_image" "team3_shimage" {
  name                = "${var.name}-shimage"
  gallery_name        = azurerm_shared_image_gallery.team3_gallery.name
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  os_type             = "Linux"
  specialized         = false
  hyper_v_generation  = "V2"

  identifier {
    publisher = var.name
    offer     = "web-template"
    sku       = "wordpress-v1"
  }

  depends_on = [azurerm_shared_image_gallery.team3_gallery]
}

resource "azurerm_shared_image_version" "team3_version" {
  name                = "1.0.0"
  gallery_name        = azurerm_shared_image_gallery.team3_gallery.name
  image_name          = azurerm_shared_image.team3_shimage.name
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  managed_image_id    = azurerm_image.team3_image.id

  target_region {
    name                   = azurerm_shared_image.team3_shimage.location
    regional_replica_count = 6
  }

  depends_on = [azurerm_shared_image.team3_shimage]
}

