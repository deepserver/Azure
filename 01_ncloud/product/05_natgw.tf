resource "ncloud_nat_gateway" "lch_natgw" {
  name        = "lch-natgw"
  vpc_no      = ncloud_vpc.lch_vpc.id
  subnet_no   = ncloud_subnet.lch_nat.id
  zone        = "KR-1"
  description = "LCH NCLOUD NAT GATEWAY"
}
