resource "aws_vpc" "main" {
  cidr_block         = "${var.vpc_cidr_block}"
  enable_dns_support = true
  enable_dns_hostnames  = true
  

  tags = {
    Name        = "${var.application}-${var.environment}"
    ManagedBy   = "terraform"
    Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${var.application}-${var.environment}"
    ManagedBy   = "terraform"
    Environment = "${var.environment}"
  }
}


resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name        = "${var.application}-${var.environment}-public"
    Environment = "${var.environment}"
  }
}


resource "aws_main_route_table_association" "main" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.public.id}"
}


resource "aws_route_table_association" "public_1" {
  subnet_id      = "${aws_subnet.public_1.id}"
  route_table_id = "${aws_route_table.public.id}"
}



resource "aws_subnet" "public_1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.cidr_block_public_1}"
  availability_zone = "${var.az1_name}"

  tags = {
    Name        = "${var.application}-${var.environment}-public-1"
    ManagedBy   = "terraform"
    Environment = "${var.environment}"
  }
}


data "aws_region" "current_region" {}