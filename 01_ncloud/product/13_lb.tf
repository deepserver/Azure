resource "ncloud_lb" "lch_lb" {
  name           = "lch-lb"
  network_type   = "PUBLIC"
  type           = "APPLICATION"
  subnet_no_list = [ncloud_subnet.lch_load.subnet_no]
}
