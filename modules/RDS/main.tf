resource "aws_db_subnet_group" "rds_sg_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.rds_subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name   = "${var.rds_name}-sg"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.rds_name}-sg"
  }
}

resource "aws_security_group_rule" "rds_allow_ec2" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_sg.id
  source_security_group_id = var.ec2_sg_id # Allow access from EC2 security group
}

resource "aws_security_group_rule" "rds_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.rds_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_db_instance" "mysql" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "toko"
  password               = var.rds_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  deletion_protection    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_sg_group.name
}