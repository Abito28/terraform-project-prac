variable "vpc_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "ec2_name" {
  type    = string
  default = "my-ec2-instance"
}

variable "subnet_id" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2-ami" {
  type = string
  default = "ami-0b4a1b07f9ca13717"
}