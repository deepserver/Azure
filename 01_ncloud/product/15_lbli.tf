resource "ncloud_lb_listener" "lch_lbli" {
  load_balancer_no = ncloud_lb.lch_lb.load_balancer_no
  protocol         = "HTTP"
  port             = 80
  target_group_no  = ncloud_lb_target_group.lch_lbtg.target_group_no
}
