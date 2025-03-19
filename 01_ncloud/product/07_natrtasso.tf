resource "ncloud_route_table_association" "lch_natrtasso1" {
  route_table_no = ncloud_route_table.lch_natrt.id
  subnet_no      = ncloud_subnet.lch_web1.id
}
resource "ncloud_route_table_association" "lch_natrtasso2" {
  route_table_no = ncloud_route_table.lch_natrt.id
  subnet_no      = ncloud_subnet.lch_web2.id
}
resource "ncloud_route_table_association" "lch_natrtasso3" {
  route_table_no = ncloud_route_table.lch_natrt.id
  subnet_no      = ncloud_subnet.lch_db.id
}
