resource "ncloud_route_table" "lch_rt" {
  vpc_no                = ncloud_vpc.lch_vpc.id
  supported_subnet_type = "PUBLIC"
  name                  = "lch-rt"
}

resource "ncloud_route_table" "lch_natrt" {
  vpc_no                = ncloud_vpc.lch_vpc.id
  supported_subnet_type = "PRIVATE"
  name                  = "lch-natrt"
}
