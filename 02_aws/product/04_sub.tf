resource "aws_subnet" "lch_puba" {
  vpc_id     = aws_vpc.lch_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "lch-puba"
  }
}
resource "aws_subnet" "lch_pubc" {
  vpc_id     = aws_vpc.lch_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "lch-pubc"
  }
}
resource "aws_subnet" "lch_pria" {
  vpc_id     = aws_vpc.lch_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "lch-pria"
  }
}
resource "aws_subnet" "lch_pric" {
  vpc_id     = aws_vpc.lch_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "lch-pric"
  }
}
resource "aws_subnet" "lch_dba" {
  vpc_id     = aws_vpc.lch_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "lch-dba"
  }
}
resource "aws_subnet" "lch_dbc" {
  vpc_id     = aws_vpc.lch_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "lch-dbc"
  }
}