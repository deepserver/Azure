resource "aws_route_table" "lch_rt" {
  vpc_id = aws_vpc.lch_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lch_ig.id
  }
  tags = {
    Name = "lch-rt"
  }
}