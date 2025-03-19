resource "aws_lb" "lch_lb" {
  name               = "lch-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lch_sg.id]
  subnets            = [aws_subnet.lch_puba.id, aws_subnet.lch_pubc.id]

  tags = {
    Name = "lch-lb"
  }
}

output "load-dns" {
  value = aws_lb.lch_lb.dns_name
}
