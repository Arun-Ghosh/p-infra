output "subnet_id" {
  value       = "${aws_db_subnet_group.subnet_group.id}"
  description = "Subnet group ID of the database"
}

output "subnet_name" {
  value       = "${aws_db_subnet_group.subnet_group.name}"
  description = "Security group name database"
}