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