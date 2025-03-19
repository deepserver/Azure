resource "ncloud_route_table_association" "lch_rtasso1" {
  route_table_no = ncloud_route_table.lch_rt.id
  subnet_no      = ncloud_subnet.lch_bat.id
}
resource "ncloud_route_table_association" "lch_rtasso2" {
  route_table_no = ncloud_route_table.lch_rt.id
  subnet_no      = ncloud_subnet.lch_load.id
}
resource "ncloud_route_table_association" "lch_rtasso3" {
  route_table_no = ncloud_route_table.lch_rt.id
  subnet_no      = ncloud_subnet.lch_nat.id
}
