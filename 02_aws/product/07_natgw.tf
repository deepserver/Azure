resource "aws_eip" "natgw_ip" {
    domain  = "vpc"
}
resource "aws_nat_gateway" "lch_natgw" {
  allocation_id = aws_eip.natgw_ip.id
  subnet_id = aws_subnet.lch_puba.id
  tags = {
    Name = "lch-ngw"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.lch_ig]
}
output "aws_eip" {
    value = aws_eip.natgw_ip.public_ip
}
