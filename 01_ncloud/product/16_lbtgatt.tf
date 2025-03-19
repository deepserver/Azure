resource "ncloud_lb_target_group_attachment" "lch_lbtgat" {
  target_group_no = ncloud_lb_target_group.lch_lbtg.target_group_no
  target_no_list  = [ncloud_server.lch_web1_server.instance_no, ncloud_server.lch_web2_server.instance_no]
}
