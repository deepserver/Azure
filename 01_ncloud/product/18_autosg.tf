resource "ncloud_auto_scaling_group" "lch_autosg" {
  access_control_group_no_list = [ncloud_vpc.lch_vpc.default_access_control_group_no]
  subnet_no                    = ncloud_subnet.lch_web1.id
  launch_configuration_no      = ncloud_launch_configuration.lch_lc.id
  min_size                     = 1
  max_size                     = 6
  desired_capacity             = 1
  health_check_type_code       = "SVR"
  default_cooldown             = 300
  health_check_grace_period    = 300
}
