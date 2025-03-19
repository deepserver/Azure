resource "aws_vpc" "lch_vpc" {
  cidr_block           = var.cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    name = "lch-vpc"
  }
}
output "vpc-id" {
  value = aws_vpc.lch_vpc.owner_id
}