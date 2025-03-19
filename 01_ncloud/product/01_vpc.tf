resource "ncloud_vpc" "lch_vpc" {
    name = "lch-vpc"
    ipv4_cidr_block = var.cidr
}
