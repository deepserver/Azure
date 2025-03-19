resource "aws_ami_from_instance" "lch_ami" {
  name               = "lch-ami"
  source_instance_id = aws_instance.lch_web.id

  tags = {
    Name = "lch-ami"
  }
}
