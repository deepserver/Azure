variable "access_key" {
  type    = string
  default = "ncp_iam_BPAMKR5DUN2d1TBPqBzq"
}

variable "secret_key" {
  type    = string
  default = "ncp_iam_BPKMKR12twQcNj1UZ8TfpzUko6PvTQIcFw"
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
