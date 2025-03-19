resource "aws_db_subnet_group" "lch_dbsg" {
  name       = "lch-dbsg"
  subnet_ids = [aws_subnet.lch_dba.id, aws_subnet.lch_dbc.id]
}

resource "aws_db_instance" "lch_db" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "wordpress"
  identifier             = "lch"
  username               = "root"
  password               = "It12345!"
  availability_zone      = "ap-northeast-2a"
  db_subnet_group_name   = aws_db_subnet_group.lch_dbsg.id
  vpc_security_group_ids = [aws_security_group.lch_sg.id]
  skip_final_snapshot    = true

  tags = {
    Name = "lch-db"
  }
}
