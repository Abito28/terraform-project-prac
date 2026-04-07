variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "my-vpc"
}

# variable "subnet_cidr" {
#   type    = string
#   default = "10.0.1.0/24"
# }

variable "subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "public" = {
      cidr = "10.0.1.0/24"
      az   = "ap-northeast-1a"
    }
    "private" = {
      cidr = "10.0.2.0/24"
      az   = "ap-northeast-1a"
    }
    "private-2" = {
      cidr = "10.0.3.0/24"
      az   = "ap-northeast-1c"
    }

  }
}