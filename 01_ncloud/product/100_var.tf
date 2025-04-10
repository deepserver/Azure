variable "access_key" {
  type    = string
  default = ""
}

variable "secret_key" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = "KR"
}

variable "site" {
  type    = string
  default = "public"
}

variable "support_vpc" {
  type    = bool
  default = true
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}
