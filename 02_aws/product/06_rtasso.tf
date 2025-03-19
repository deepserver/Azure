resource "aws_route_table_association" "lch_rtassoa" {
  subnet_id      = aws_subnet.lch_puba.id
  route_table_id = aws_route_table.lch_rt.id
}
resource "aws_route_table_association" "lch_rtassoc" {
  subnet_id      = aws_subnet.lch_pubc.id
  route_table_id = aws_route_table.lch_rt.id
}