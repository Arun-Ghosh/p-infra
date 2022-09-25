provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "test-terraform-state-995"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}
