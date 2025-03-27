resource "time_sleep" "wait_before_stop" {

  create_duration = "120s"

  depends_on = [azurerm_linux_virtual_machine.team3_web1]
}

resource "null_resource" "stop_web1" {
  provisioner "local-exec" {
    command = "az vm stop --resource-group 02-team3-rg --name team3-web1"
  }

  depends_on = [time_sleep.wait_before_stop]
}

resource "null_resource" "deal_web1" {
  provisioner "local-exec" {
    command = "az vm deallocate --resource-group 02-team3-rg --name team3-web1"
  }

  depends_on = [null_resource.stop_web1]
}

resource "null_resource" "gen_web1" {
  provisioner "local-exec" {
    command = "az vm generalize --resource-group 02-team3-rg --name team3-web1"
  }

  depends_on = [null_resource.deal_web1]
}
