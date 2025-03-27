resource "ncloud_launch_configuration" "lch_lc" {
  name = "lch-lc"
  server_image_product_code = "SW.VSVR.OS.LNX64.ROCKY.0808.B050"
  server_product_code = "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002"
  login_key_name = "lch-key"
  init_script_no = ncloud_init_script.lch_init_ssh_wordpress.id
}