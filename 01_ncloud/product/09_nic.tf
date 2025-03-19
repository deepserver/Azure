resource "ncloud_network_interface" "lch_nic_bat" {
    name                  = "lch-nic-bat1"
    description           = "ncloud_terraform"
    subnet_no             = ncloud_subnet.lch_bat.id
    private_ip            = "10.0.0.11"
    access_control_groups = [ncloud_access_control_group.lch_acg.id]
}

resource "ncloud_network_interface" "lch_nic_web1" {
    name                  = "lch-nic-web1"
    description           = "ncloud_terraform"
    subnet_no             = ncloud_subnet.lch_web1.id
    private_ip            = "10.0.3.11"
    access_control_groups = [ncloud_access_control_group.lch_acg.id]
}

resource "ncloud_network_interface" "lch_nic_web2" {
    name                  = "lch-nic-web2"
    description           = "ncloud_terraform"
    subnet_no             = ncloud_subnet.lch_web2.id
    private_ip            = "10.0.4.11"
    access_control_groups = [ncloud_access_control_group.lch_acg.id]
}

resource "ncloud_network_interface" "lch_nic_db" {
    name                  = "lch-nic-db"
    description           = "ncloud_terraform"
    subnet_no             = ncloud_subnet.lch_db.id
    private_ip            = "10.0.5.11"
    access_control_groups = [ncloud_access_control_group.lch_acg.id]
}