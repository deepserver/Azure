data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "team3_kv" {
  name                        = "${var.name}-keyvault"
  location                    = azurerm_resource_group.team3_rg.location
  resource_group_name         = azurerm_resource_group.team3_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Encrypt",
      "Decrypt",
      "Get",
      "Create",
      "List"
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Purge"
    ]
  }
}

resource "azurerm_key_vault_secret" "team3_ssh_key" {
  name         = "team3-key"
  value        = file("id_rsa")
  key_vault_id = azurerm_key_vault.team3_kv.id

  depends_on = [azurerm_key_vault.team3_kv]
}
