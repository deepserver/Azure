resource "aws_internet_gateway" "lch_ig" {
  vpc_id = aws_vpc.lch_vpc.id

  tags = {
    Name = "lch-ig"
  }
}