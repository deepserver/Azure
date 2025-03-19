data "aws_ami" "lch_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10*-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

resource "aws_eip" "web_eip" {
  domain     = "vpc"
  instance   = aws_instance.lch_web.id
  depends_on = [aws_instance.lch_web]
}

resource "aws_instance" "lch_web" {
  ami                         = data.aws_ami.lch_ami.id
  instance_type               = "t2.micro"
  key_name                    = "lch-key"
  vpc_security_group_ids      = [aws_security_group.lch_sg.id]
  availability_zone           = "ap-northeast-2a"
  private_ip                  = "10.0.0.11"
  subnet_id                   = aws_subnet.lch_puba.id
  associate_public_ip_address = true
  user_data                   = file("./instance_wordpress_sh.txt")
  tags = {
    Name = "lch-web"
  }
}

output "ins-ip" {
  value = aws_eip.web_eip.public_ip
}
