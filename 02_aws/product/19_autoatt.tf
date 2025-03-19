resource "aws_autoscaling_attachment" "lch_autosgat" {
  autoscaling_group_name = aws_autoscaling_group.lch_autosg.id
  lb_target_group_arn    = aws_lb_target_group.lch_lbtg.arn
}
