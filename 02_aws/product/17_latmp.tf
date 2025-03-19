resource "aws_launch_template" "lch_latmp" {
  name = "lch-latmp"
  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
        volume_size = 10
        volume_type = "gp2"
    }
  }

  image_id = aws_ami_from_instance.lch_ami.id
  instance_type = "t2.micro"
  key_name = "lch-key"
  vpc_security_group_ids = [aws_security_group.lch_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
        Name = "lch-latmp"
    }
  }
  user_data = filebase64("${path.module}/instance_wordpress_sh.txt")
}