resource "aws_db_subnet_group" "subnet_group" {
  name = "${var.application_name}-db-subnet-group-${var.environment}"
  subnet_ids = [ "${var.public_1_subnet_id}" ]

  tags = {
    Name        = "${var.application_name}-${var.environment}"
    ManagedBy   = "terraform"
    Environment = "${var.environment}"
  }
}
