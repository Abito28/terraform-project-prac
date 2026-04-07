resource "aws_db_subnet_group" "rds_sg_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.rds_subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}


resource "aws_db_instance" "mysql" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "toko"
  password               = "toko1234"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  deletion_protection    = false
  vpc_security_group_ids = []
  db_subnet_group_name   = aws_db_subnet_group.rds_sg_group.name
}