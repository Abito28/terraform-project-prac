locals {
  public_subnets  = { for k, v in var.subnets : k => v if v.type == "public" }
  private_subnets = { for k, v in var.subnets : k => v if v.type == "private" }
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  for_each                = var.subnets
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = each.value.type == "public"
  availability_zone       = each.value.az
  lifecycle {
    create_before_destroy = false
  }

  tags = {
    Name = "${var.vpc_name}-${each.key}-subnet"
    type = each.value.type
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

resource "aws_route_table_association" "public_association" {
  for_each       = local.public_subnets
  subnet_id      = aws_subnet.main["public"].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_association" {
  for_each       = local.private_subnets
  subnet_id      = aws_subnet.main["private"].id
  route_table_id = aws_route_table.private_rt.id
}