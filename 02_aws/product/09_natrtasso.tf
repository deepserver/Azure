resource "aws_route_table_association" "lch_natrtassoa" {
  subnet_id      = aws_subnet.lch_pria.id
  route_table_id = aws_route_table.lch_natrt.id
}
resource "aws_route_table_association" "lch_natrtassoc" {
  subnet_id      = aws_subnet.lch_pric.id
  route_table_id = aws_route_table.lch_natrt.id
}
resource "aws_route_table_association" "lch_natrtassodba" {
  subnet_id      = aws_subnet.lch_dba.id
  route_table_id = aws_route_table.lch_natrt.id
}
resource "aws_route_table_association" "lch_natrtassodbc" {
  subnet_id      = aws_subnet.lch_dbc.id
  route_table_id = aws_route_table.lch_natrt.id
}
