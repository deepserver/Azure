resource "ncloud_route" "lch_natgwrt" {
    route_table_no = ncloud_route_table.lch_natrt.id
    destination_cidr_block = "0.0.0.0/0"
    target_type = "NATGW"
    target_name = ncloud_nat_gateway.lch_natgw.name
    target_no = ncloud_nat_gateway.lch_natgw.id
}