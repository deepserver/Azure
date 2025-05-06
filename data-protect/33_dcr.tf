# Create Data Collection Rules
resource "azurerm_monitor_data_collection_rule" "team3_dcr" {
  name                        = "${var.name}-dcr"
  resource_group_name         = azurerm_resource_group.team3_rg.name
  location                    = azurerm_resource_group.team3_rg.location
  data_collection_endpoint_id = azurerm_monitor_data_collection_endpoint.team3_dce.id

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.team3_logws.id
      name                  = "ftp-log"
    }

    event_hub {
      event_hub_id = azurerm_eventhub.team3_eventhub.id
      name         = "${var.name}-dcr-eventhub"
    }

    azure_monitor_metrics {
      name = "dcr-dest-metrics"
    }
  }

  data_sources {
    syslog {
      name           = "all-syslog"
      facility_names = ["*"]
      log_levels     = ["Debug"]
      streams        = ["Microsoft-Syslog"]
    }

    syslog {
      name           = "ftp-syslog"
      facility_names = ["ftp"]
      log_levels     = ["Info"]
      streams        = ["Microsoft-Syslog"]
    }
  }

  data_flow {
    streams      = ["Microsoft-Syslog"]
    destinations = ["ftp-log"]
  }
}

resource "azurerm_monitor_data_collection_rule_association" "team3_dcr_asso" {
  name                    = "${var.name}-dcr-asso"
  target_resource_id      = azurerm_linux_virtual_machine.team3_ftp.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.team3_dcr.id
}
