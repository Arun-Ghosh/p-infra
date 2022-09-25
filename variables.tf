### TERRAFORM PROVIDER

### Network

variable "aws_region" {
  default = "us-east-1"
}

variable "cidr_block_vpc" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "10.46.0.0/16"
    "prod" = "20.46.0.0/16"
  }
}

variable "cidr_block_public_1" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "10.46.0.0/24"
    "prod" = "20.46.0.0/24"
  }
}

### APP
variable "app_ami" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "ami-0478d70804d89d4e7"
    "prod" = "ami-0478d70804d89d4e7"
  }
}

variable "app_name" {
  default = "ppro"
}

variable "key_name" {
  description = "description"
  default     = "bastion"
}

variable "public_key_1" {
  description = "description"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDSqdU2hWH/l1JveinnD9OHgHodV3vQMBWUaO98LPIGvpNmp4t+RqdrZDINMsicFQsMVY1EPqoMkJv0AduZ9Yj2t2vpHDkhSOtYc+EP30zolpo+WWbu3yVaWWDSK7ae/Q8hTldOBKIkj9sS1BATuYGNird7QLMEnuz/7NOmwX8zUUkMJNa1DvvvPuhgFY+io4eBXfbm0Fse7BbavyNBfbCAfeX79Zm6heCRcyQm+XfPKcvuQ7OYTwf7/QTF1+j9ypVIR4gND0OO/sTDEPmW7o8K3yQAwxkpdVZa6zbCYbdjSgvp588JC/07+mUVg1h/yDNFEzyryJyBF7cnOXJroDI0i+z/w0kheG8y3FKOeF4FqAXg3dcD/m1y3oVip6swe8iwQXyh5d5QEfdfwgsfmXzL9OyRVowkADp7J55+cXwCM9pG2kwVlQ8A2OwKIwciipfeeR8mpQUcEU7zBm09hDJnw9ROBh3mZ35rojsCvjht21fIHihQnJLHQ/vIx0AIO6+vg0PqrOSeGlLKfEbWECRHeGSNYlnu0rzG1ZA13DHnm3DZrJzHsBAVfaK4aHbe7W0cyhqFvDhOAuJbX8DByo8FTwdJ/ZJmwljxyXjVlHV7cuNLeIvl6hp7vZAxmoSuOdGK6pykd7IeTZcJXlxqw1uWgaD12unBrL/dB1heaoemJw== arunkrishnaghosh@Aruns-MBP"
}
variable "application" {
  default = "ppro"
}

### Mysql

variable "mysql_db_engine" {
  description = "description"
  default     = "mysql"
}

variable "from_port_mysql_1" {
  default = 0
}

variable "to_port_mysql_1" {
  default = 0
}

variable "rxd_locales_rds_instance_identifier" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "ppro-stg"
    "prod" = "ppro-prod"
  }
}
variable "mysql_allocated_storage" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "20"
    "prod" = "20"
  }
}

variable "mysql_engine_version" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "8.0.20"
    "prod" = "8.0.20"
  }
}

variable "mysql_instance_class" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "db.t3.micro"
    "prod" = "db.t3.micro"
  }
}

### Mysql
variable "mysql_db_port" {
  description = "description"
  default     = "3306"
}
variable "another_cidr" {
  description = "description"
  default     = "172.31.0.0/16"
}

variable "protocol_1" {
  description = "description"
  default     = -1
}

variable "ppro_db_application_name" {
  description = "description"
  default     = "ppro-db"
}

variable "ppro_rds_instance_identifier" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "ppro-stg"
    "prod" = "ppro-prod"
  }
}

variable "mysql_database_user" {
  description = "description"
  type        = map(string)

  default = {
    "stg"  = "admin"
    "prod" = "admin"
  }
}
