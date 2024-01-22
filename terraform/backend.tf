provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket         = "asg-spot-s3fs-s3-to-mount"
    key            = "openinfra/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "openinfra_terraform_locks"
  }
}
