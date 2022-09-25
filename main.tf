data "aws_availability_zone" "az1" { name = "${var.aws_region}a" }

module "network" {
  source = "./network"

  application          = var.application
  environment          = terraform.workspace
  vpc_cidr_block       = lookup(var.cidr_block_vpc, terraform.workspace)
  cidr_block_public_1  = lookup(var.cidr_block_public_1, terraform.workspace)
  az1_name             = data.aws_availability_zone.az1.name
  vpc_id               = module.network.main_vpc_id
  route_tables         = module.network.public_route_table_id

}


###  EC2

module "ec2_instance" {
  source = "./ec2"

  application        = var.application
  environment        = terraform.workspace
  vpc_id             = module.network.main_vpc_id
  app_ami            = lookup(var.app_ami, terraform.workspace)
  public_1_subnet_id = module.network.public_1_subnet_id
  app_name           = var.app_name
  key_name           = module.ec2_key_pair_1.key_name
  cidr_block_vpc     = lookup(var.cidr_block_vpc, terraform.workspace)
}

# For Instances

module "ec2_key_pair_1" {
  source = "./ec2-key-pair"

  key_name   = var.key_name
  public_key = var.public_key_1

}

### Mysql-Security-Group

module "mysql-security-group_1" {
  source = "./mysql-security-group"

  environment      = terraform.workspace
  vpc_id           = module.network.main_vpc_id
  vpc_cidr_block   = lookup(var.cidr_block_vpc, terraform.workspace)
  application_name = var.ppro_db_application_name
  from_port        = var.from_port_mysql_1
  to_port          = var.to_port_mysql_1
  protocol         = var.protocol_1
}


### Mysql-Subnet-Group

module "mysql-subnet-group_1" {
  source = "./mysql-subnet-group"

  environment        = terraform.workspace
  public_1_subnet_id = module.network.public_1_subnet_id
  application_name   = var.ppro_db_application_name
}

### SSM

data "aws_ssm_parameter" "mysql_db_password" {
  name            = "/use1/ppro/mysql/dbpassword"
  with_decryption = true

}


### Mysql

module "mysql_1" {
  source = "./mysql"

  application                  = var.application
  environment                  = terraform.workspace
  application_name             = var.ppro_db_application_name
  mysql_instance_identifier    = lookup(var.ppro_rds_instance_identifier, terraform.workspace)
  mysql_allocated_storage      = lookup(var.mysql_allocated_storage, terraform.workspace)
  mysql_engine_version         = lookup(var.mysql_engine_version, terraform.workspace)
  mysql_instance_class         = lookup(var.mysql_instance_class, terraform.workspace)
  mysql_database_user          = lookup(var.mysql_database_user, terraform.workspace)
  mysql_database_password      = data.aws_ssm_parameter.mysql_db_password.value
  mysql_vpc_security_group_ids = [ module.mysql-security-group_1.security_group_id ]
  mysql_db_subnet_group_name   = module.mysql-subnet-group_1.subnet_name
}
