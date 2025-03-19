resource "aws_lb_listener" "lch_lbli" {
  load_balancer_arn = aws_lb.lch_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lch_lbtg.arn
  }

  tags = {
    Name = "lch-lbli"
  }
}
