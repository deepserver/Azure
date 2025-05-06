# Create Data Collection Endpoint
resource "azurerm_monitor_data_collection_endpoint" "team3_dce" {
  name                = "${var.name}-dce"
  resource_group_name = azurerm_resource_group.team3_rg.name
  location            = azurerm_resource_group.team3_rg.location
  kind                = "Linux"
}
