data "ncloud_server_image_numbers" "kvm_image" {
  server_image_name = "rocky-9.4-base"
  filter {
    name = "hypervisor_type"
    values = ["KVM"]
  }
}

data "ncloud_server_specs" "kvm_spec" {
  filter {
    name = "server_spec_code"
    values = ["s2-g3"]
  }
}

resource "ncloud_server" "lch_bat_server" {
  subnet_no           = ncloud_subnet.lch_bat.id
  name                = "lch-bat-server"
  server_image_number = data.ncloud_server_image_numbers.kvm_image.image_number_list.0.server_image_number
  server_spec_code    = data.ncloud_server_specs.kvm_spec.server_spec_list.0.server_spec_code
  init_script_no      = ncloud_init_script.lch_init_ssh.id

  network_interface {
    network_interface_no = ncloud_network_interface.lch_nic_bat.id
    order                = 0
  }
}
resource "ncloud_public_ip" "public_ip_bat" {
  server_instance_no = ncloud_server.lch_bat_server.id
}
output "bat-pulic-ip" {
  value = ncloud_public_ip.public_ip_bat.public_ip
}

resource "ncloud_server" "lch_web1_server" {
  subnet_no           = ncloud_subnet.lch_web1.id
  name                = "lch-web1-server"
  server_image_number = data.ncloud_server_image_numbers.kvm_image.image_number_list.0.server_image_number
  server_spec_code    = data.ncloud_server_specs.kvm_spec.server_spec_list.0.server_spec_code
  init_script_no      = ncloud_init_script.lch_init_ssh_wordpress.id

  network_interface {
    network_interface_no = ncloud_network_interface.lch_nic_web1.id
    order                = 0
  }
}

resource "ncloud_server" "lch_web2_server" {
  subnet_no           = ncloud_subnet.lch_web2.id
  name                = "lch-web2-server"
  server_image_number = data.ncloud_server_image_numbers.kvm_image.image_number_list.0.server_image_number
  server_spec_code    = data.ncloud_server_specs.kvm_spec.server_spec_list.0.server_spec_code
  init_script_no      = ncloud_init_script.lch_init_ssh_wordpress.id

  network_interface {
    network_interface_no = ncloud_network_interface.lch_nic_web2.id
    order                = 0
  }
}

resource "ncloud_server" "lch_db_server" {
  subnet_no           = ncloud_subnet.lch_db.id
  name                = "lch-db-server"
  server_image_number = data.ncloud_server_image_numbers.kvm_image.image_number_list.0.server_image_number
  server_spec_code    = data.ncloud_server_specs.kvm_spec.server_spec_list.0.server_spec_code
  init_script_no      = ncloud_init_script.lch_init_ssh.id

  network_interface {
    network_interface_no = ncloud_network_interface.lch_nic_db.id
    order                = 0
  }
}
