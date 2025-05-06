# User Assigned 
resource "azurerm_user_assigned_identity" "team3_user_id" {
  name                = "${var.name}-user-id"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
}
