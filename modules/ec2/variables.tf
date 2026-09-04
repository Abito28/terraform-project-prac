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

variable "subnets" {
  type = map(object({
    cidr = string
    az   = string
    type = string
  }))
  default = {
    "public"    = { cidr = "10.0.1.0/24", az = "ap-northeast-1a", type = "public" }
    "public-2"  = { cidr = "10.0.2.0/24", az = "ap-northeast-1c", type = "public" }
    "private"   = { cidr = "10.0.3.0/24", az = "ap-northeast-1a", type = "private" }
    "private-2" = { cidr = "10.0.4.0/24", az = "ap-northeast-1c", type = "private" }
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2-ami" {
  type    = string
  default = "ami-0b4a1b07f9ca13717"
}

/* variable "alb_subnets" {
  type = list(string)
} */