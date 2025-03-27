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
  default = "-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAtYnCHn9ldPsdnRUDBg/Yp7gD8IBhmt62kEX1mt4D/nkoBkP1\nhDN9ex+xyObGKDVYY4gChHeHEs2SuXL9S4AyFARPsi1brkD9RvyShcOaATYMUjcj\nr5WqT+dr9FMhVOSaInfPDuSrKDJQLiMatAOfPCXI3jB9EMb/IZWIQcx7f6DQhF0t\naHz2u85uCRfHUHKV/Tv9vzBzZO1+S+2NZ2v775YIk9OXJAMd6AFUSAoBCZKrxYjq\nt+BEBd660tgDCh+vaUhwO+MZfZkFjjqEyVvzOzy2EOZRnyB/PJudwlLOUnoyz2O1\n4q69WGtwXfAftnLLMplr3gV4CrB2ZQEp7QseTwIDAQABAoIBAEwuSSXfNEZI8v5u\nSNyMXdDUKeMNHOiOuXIFybF5pZduZFtsvWUC7o9yl3rFTTamXDc4ZkYMmsRLPF1S\nYfUDEQDRZlhRLH4Ni7v0VdCIauJDOhxuQy110wjBBs567Cvh2sTIHj4Tu7eclYUm\n+he8xV/KQ2bqVjFqMLp5M7rZAqJltuvyHlsnODplCiT60ztV6tYVD/QTfTgENNQ7\nR/vZIhJlehyIk7pkV8kzGk1obmHK8eOwZn583QrfXiZDZv9kZQ7jhnKDoJ0tOR3L\nYbixX0pJGByK+UbwYiN+SAUEI4S48Tvd7Zm+qv1jK+u5oekGrfi2xPuPbws/VeOy\n1SqeB3ECgYEA2G8xcHYkpCC10zEPj/Q0aMIDrbkTX5KSstYaZbiRvm7hVpw2f77f\nB2hmB1UGKcB4KVts4IbWVqhpA+yGYPHH/qNzKX0kEg2xCq5lRCHi1KLRomis9spu\nU8KpLZaJlh6pkNa3SFRu56cxh0CY/yuxJRM1PifYvWbdpSfYpiPn2MMCgYEA1rl5\nKaNzannovGjq951kHb38SqbRuRtDdcNOmefFuamqxIcy5gho7mbuWtnuajnhmcqU\nSMEjlefafxcBjOucqWN5mDsIDWfYuuW/n9Kd403RKvM9YLIqOD+nYTDnd4dhsge5\nR00WhGRf267747IzM8ihSCT6a7eEPmX6bhoqa4UCgYAdKgaQb+sKDrpRhffh3vc8\n8n/KZfj9VOPdo0oVUOSas5g7snsJha/J8MBm1ocpEx1d/UrTinfRX4ofFD0bTRk0\n79Nx0MIOiLfFh7BvmN1W58W1y8Ma0jZBpSZk1Tce+mzA7p3t6iqznmznG8ZCBCIv\nq8Ht6TKkevr86TyhTo9MPwKBgCKv5aXXVL6/oNxG6qZDk7fGSCpbFogbomM0wM7W\nBTf/86k52fwVIbZZhGnCyOP6I7qvYhL6uF/wC3j6Y3K7YRxwCGWSK7PWsclHchRE\nduMQYBjbIHAtd+qMReLKfqntgde7ra+aAWgzutSHSQO4dtMHtx4rcxTRmZhm6vS8\nX1vtAoGBAMOKZ2VG8ScBuNXwmbAckuMucS+1J5G4SxfONRgt4on0Dh/phOiUp0ev\n3XwUqYaqrN8XryyVvClSmsS85AXENuqfHbx17jIznveDAjcOiN/zFvCg39H6USqD\nca/lOkEp/D1Dws/K9D3Eh/+ESdRXPFqPVQxhtQqCNNU+E7R+er4R\n-----END RSA PRIVATE KEY-----"
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
