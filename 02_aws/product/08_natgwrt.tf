resource "aws_route_table" "lch_natrt" {
  vpc_id = aws_vpc.lch_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.lch_natgw.id
  }
  tags = {
    Name = "lch-natrt"
  }
}