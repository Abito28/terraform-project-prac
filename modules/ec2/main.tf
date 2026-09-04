resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id
  name   = "${var.ec2_name}-sg"
}

resource "aws_security_group_rule" "ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_instance" "web" {
  ami                    = var.ec2-ami # Amazon Linux 2 AMI 
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "Hello, World!" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = var.ec2_name
  }
}

# resource "aws_instance" "management"{
# ami                   = var.ec2-ami # Amazon Linux 2 AMI 
#   instance_type          = var.instance_type
#   subnet_id              = var.subnet_id
#   vpc_security_group_ids = [aws_security_group.ec2_sg.id]

#   tags = {
#     Name = "${var.ec2_name}-management"
#   }
# }


