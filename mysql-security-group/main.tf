resource "aws_security_group" "security_group" {
  name   = "${var.application_name}-${var.environment}"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.application_name}-${var.environment}"
    ManagedBy   = "terraform"
    Environment = "${var.environment}"
  }
}
