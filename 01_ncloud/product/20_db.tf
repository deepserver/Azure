resource "ncloud_mysql" "lch_mysql" {
  subnet_no          = ncloud_subnet.lch_db.id
  service_name       = "lch-mysql"
  server_name_prefix = "lch-db-server"
  user_name          = "root1"
  user_password      = "It12345!"
  host_ip            = "%"
  database_name      = "wordpress"
  is_ha              = false
}
