resource "ncloud_access_control_group" "lch_acg" {
  name        = "lch-acg"
  description = "It is lch-acg"
  vpc_no      = ncloud_vpc.lch_vpc.id
}

resource "ncloud_access_control_group_rule" "lch_acgrule" {
  access_control_group_no = ncloud_access_control_group.lch_acg.id

  inbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "22"
    description = "SSH"
  }
  inbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "53"
    description = "DNS-TCP"
  }
  inbound {
    protocol    = "UDP"
    ip_block    = "0.0.0.0/0"
    port_range  = "53"
    description = "DNS-UDP"
  } 
  inbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "80"
    description = "HTTP"
  }
  inbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0" 
    port_range  = "3306"
    description = "MySQL"
  }
  inbound {
    protocol    = "ICMP"
    ip_block    = "0.0.0.0/0" 
    description = "PING"
  }

  outbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0" 
    port_range  = "1-65535"
    description = "accept all TCP out"
  }
  outbound {
    protocol    = "UDP"
    ip_block    = "0.0.0.0/0" 
    port_range  = "1-65535"
    description = "accept all UDP out"
  }
  outbound {
    protocol    = "ICMP"
    ip_block    = "0.0.0.0/0"
    description = "accept all PING out"
  }
}

resource "ncloud_access_control_group_rule" "lch_mysql_acg_rule" {
  access_control_group_no = ncloud_mysql.lch_mysql.access_control_group_no_list[0]
  
  inbound {
    protocol = "TCP"
    ip_block = "10.0.0.0/16"
    port_range = "3306"
    description = "ALLOW internal"
  }

  outbound {
    protocol = "TCP"
    ip_block = "10.0.0.0/16"
    port_range = "3306"
    description = "ALLOW internal"
  }

  depends_on = [ ncloud_mysql.lch_mysql ]
}