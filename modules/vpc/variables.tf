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
    type = string

  }))
  default = {
    "public" = {
      cidr = "10.0.1.0/24"
      az   = "ap-northeast-1a"
      type = "public"
    }
    "public-2" = {
      cidr = "10.0.2.0/24"
      az   = "ap-northeast-1c"
      type = "public"
    }
    "private" = {
      cidr = "10.0.3.0/24"
      az   = "ap-northeast-1a"
      type = "private"
    }
    "private-2" = {
      cidr = "10.0.4.0/24"
      az   = "ap-northeast-1c"
      type = "private"
    }


  }
}
