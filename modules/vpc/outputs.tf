output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.main["public"].id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.main["private"].id,
    aws_subnet.main["private-2"].id
  ]
}

output "vpc_name" {
  value = var.vpc_name
}