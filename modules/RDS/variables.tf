variable "rds_password" {
  type      = string
  sensitive = true
}

variable "rds_subnet_ids" {
  type = list(string)
}

variable "rds_name" {
  type    = string
  default = "my-rds"
}

variable "vpc_id" {
  type = string
}

variable "ec2_sg_id" {
  type = string
}