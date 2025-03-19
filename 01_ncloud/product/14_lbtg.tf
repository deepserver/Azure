resource "ncloud_lb_target_group" "lch_lbtg" {
  vpc_no      = ncloud_vpc.lch_vpc.vpc_no
  protocol    = "HTTP"
  target_type = "VSVR"
  port        = 80
  description = "for test"
  health_check {
    protocol       = "HTTP"
    http_method    = "GET"
    port           = 80
    url_path       = "/health.html"
    cycle          = 10
    up_threshold   = 2
    down_threshold = 2
  }
  algorithm_type = "RR"
}
