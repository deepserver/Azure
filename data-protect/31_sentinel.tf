# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "team3_logws" {
  name                = "${var.name}-logws"
  location            = azurerm_resource_group.team3_rg.location
  resource_group_name = azurerm_resource_group.team3_rg.name
}

# Create Solution
resource "azurerm_log_analytics_solution" "team3_analytic_sol" {
  solution_name         = "VMsyslog"
  location              = azurerm_resource_group.team3_rg.location
  resource_group_name   = azurerm_resource_group.team3_rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.team3_logws.id
  workspace_name        = azurerm_log_analytics_workspace.team3_logws.name

  plan {
    publisher = "Microsoft"
    product   = "VMInsights"
  }
}

# Onboarding Workspace & Sentinel
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "team3_sentinel" {
  workspace_id = azurerm_log_analytics_workspace.team3_logws.id
}

