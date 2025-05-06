variable "location" {
  type    = string
  default = "Korea Central"
}

variable "name" {
  type    = string
  default = "team3"
}

variable "bastion_ip" {
  type    = string
  default = "10.0.0.4"
}

variable "local_public_ip" {
  type    = string
  default = "61.108.60.26"
}

variable "auto_ip" {
  type    = string
  default = "10.0.6.0/24"
}

variable "password" {
  type    = string
  default = "It12345!"
}

variable "id_rsa" {
  type    = string
  default = ""
}

variable "subid" {
  type    = string
  default = "99b79efe-ebd6-468c-b39f-5669acb259e1"
}

variable "backend_address_pool_name" {
  default = "team3-Backaddrpool"
}

variable "frontend_port_name" {
  default = "team3-FrontendPort"
}

variable "frontend_ip_configuration_name" {
  default = "team3-AGIPConfig"
}

variable "http_setting_name" {
  default = "team3-HTTPsetting"
}

variable "listener_name" {
  default = "team3-Listener"
}

variable "request_routing_rule_name" {
  default = "team3-RoutingRule"
}
