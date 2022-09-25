resource "aws_security_group" "ec2" {
  name   = var.app_name
  vpc_id = "${var.vpc_id}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${var.cidr_block_vpc}"]
  }

    ingress {
    protocol    = "udp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${var.application}-${var.environment}-${var.app_name}"
    ManagedBy = "terraform"
  }
}

resource "aws_instance" "ec2" {
  ami                         = "${var.app_ami}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${var.public_1_subnet_id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.ec2.id}"]
#  associate_public_ip_address = false

  root_block_device {
    volume_type = "gp2"
    volume_size = "20"
    delete_on_termination = "true"
  }

  tags = {
    Name      = "${var.application}-${var.environment}-${var.app_name}"
    ManagedBy = "terraform"
  }
}