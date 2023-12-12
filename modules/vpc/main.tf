resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {"private" = "vpc"}

}


resource "aws_subnet" "internal" {
  count             = "${length(var.internal_subnets)}" //internal_subnets = [ "10.70.0.0/19", "10.70.64.0/19" ]
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${element(var.internal_subnets, count.index)}" //internal_subnets = [ "10.70.0.0/19", "10.70.64.0/19" ]
  availability_zone = "${element(var.availability_zones, count.index)}"
  tags = {"private" = "vpc"}
}

resource "aws_subnet" "external" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(var.external_subnets, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}" // external_subnets = [ "10.10.32.0/24", "10.10.96.0/24" ]

  count                   = "${length(var.external_subnets)}"
  map_public_ip_on_launch = true

  tags = {
    name = "vpc"
    }
}


//  vpc_id        = var.is_govcloud ? data.aws_vpc.gov_dev_vpc[0].id : data.terraform_remote_state.vpc[0].outputs.vpc_id
data "terraform_remote_state" "vpc" {
  count   = !var.is_govcloud ? 1 : 0
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = var.key
    region = var.region
  }
}