resource "ncloud_subnet" "lch_bat" {
  name           = "lch-bat"
  vpc_no         = ncloud_vpc.lch_vpc.id
  subnet         = "10.0.0.0/24"
  subnet_type    = "PUBLIC"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.lch_vpc.default_network_acl_no
  usage_type     = "GEN"
}

resource "ncloud_subnet" "lch_load" {
  name           = "lch-load"
  vpc_no         = ncloud_vpc.lch_vpc.id
  subnet         = "10.0.1.0/24"
  subnet_type    = "PUBLIC"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.lch_vpc.default_network_acl_no
  usage_type     = "LOADB"
}

resource "ncloud_subnet" "lch_nat" {
  name           = "lch-nat"
  vpc_no         = ncloud_vpc.lch_vpc.id
  subnet         = "10.0.2.0/24"
  subnet_type    = "PUBLIC"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.lch_vpc.default_network_acl_no
  usage_type     = "NATGW"
}
resource "ncloud_subnet" "lch_web1" {
  name           = "lch-web1"
  vpc_no         = ncloud_vpc.lch_vpc.id
  subnet         = "10.0.3.0/24"
  subnet_type    = "PRIVATE"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.lch_vpc.default_network_acl_no
  usage_type     = "GEN"
}
resource "ncloud_subnet" "lch_web2" {
  name           = "lch-web2"
  vpc_no         = ncloud_vpc.lch_vpc.id
  subnet         = "10.0.4.0/24"
  subnet_type    = "PRIVATE"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.lch_vpc.default_network_acl_no
  usage_type     = "GEN"
}
resource "ncloud_subnet" "lch_db" {
  name           = "lch-db"
  vpc_no         = ncloud_vpc.lch_vpc.id
  subnet         = "10.0.5.0/24"
  subnet_type    = "PRIVATE"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.lch_vpc.default_network_acl_no
  usage_type     = "GEN"
}
