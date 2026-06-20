output "rds_endpoint" {
  value       = aws_db_instance.mysql.endpoint
  description = "RDS connection endpoint"
}

output "rds_port" {
  value       = aws_db_instance.mysql.port
  description = "RDS connection port"
}

output "db_name" {
  value       = aws_db_instance.mysql.db_name
  description = "RDS database name"
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "RDS security group ID"
}