resource "ncloud_auto_scaling_policy" "lch_increase" {
  name                  = "lch-increase"
  adjustment_type_code  = "CHANG"
  scaling_adjustment    = 1
  min_adjustment_step   = 1
  cooldown              = 300
  auto_scaling_group_no = ncloud_auto_scaling_group.lch_autosg.auto_scaling_group_no
}
resource "ncloud_auto_scaling_policy" "lch_decrease" {
  name                  = "lch-decrease"
  adjustment_type_code  = "CHANG"
  scaling_adjustment    = -1
  min_adjustment_step   = 1
  cooldown              = 300
  auto_scaling_group_no = ncloud_auto_scaling_group.lch_autosg.auto_scaling_group_no
}
