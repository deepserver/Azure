resource "aws_autoscaling_group" "lch_autosg" {
  name                      = "lch-autosg"
  min_size                  = 1
  max_size                  = 6
  desired_capacity          = 1
  health_check_grace_period = 30
  health_check_type         = "EC2"
  force_delete              = false
  vpc_zone_identifier       = [aws_subnet.lch_puba.id, aws_subnet.lch_pubc.id]

  launch_template {
    id      = aws_launch_template.lch_latmp.id
    version = "$Latest"
  }
}
