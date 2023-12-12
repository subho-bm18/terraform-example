provider "aws" {
  version = "3.76.1"
  region  = var.region
  profile = var.aws_profile
}

provider "aws" {
  alias = "useast2"
  version = "3.76.1"
  profile = var.aws_profile
}

provider "aws" {
  alias = "uswest1"
  version = "3.76.1"
  region  = var.is_govcloud ? var.region : "us-west-1"
  profile = var.aws_profile
}


terraform {
  backend "s3" {
  }
}

data "aws_vpc" "dev_vpc" {
  filter {
    name   = "tag:Name"
    values = [local.vpc_name]
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "tag:${var.pvt_subnet_filter_key}"
    values = "xxx"
  }
  filter {
    name   = "vpc-id"
    values = "vvv"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = var.key
    region = var.region
  }
}
