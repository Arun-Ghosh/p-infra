resource "aws_db_instance" "default" {
  identifier                = "${var.mysql_instance_identifier}"
  allocated_storage         = "${var.mysql_allocated_storage}"
  engine                    = "mysql"
  engine_version            = "${var.mysql_engine_version}"
  instance_class            = "${var.mysql_instance_class}"
#  name                      = "${var.mysql_database_name}"
  username                  = "${var.mysql_database_user}"
  password                  = "${var.mysql_database_password}"
  db_subnet_group_name      = "${var.mysql_db_subnet_group_name}"
  vpc_security_group_ids    = "${var.mysql_vpc_security_group_ids}"
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"


  tags = {
    Name        = "${var.application_name}-db-${var.environment}"
    ManagedBy   = "terraform"
    Environment = "${var.environment}"
  }
}