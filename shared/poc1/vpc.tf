# Use data source to fetch available availability zones
data "aws_availability_zones" "available" {}

# creating VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.6.0"

  # Input variables for the VPC module
  name = local.vpc_name # Name of the VPC
  cidr = local.vpc_cidr_block # CIDR block for the VPC

  azs            = data.aws_availability_zones.available.names # Availability zones for the VPC
  public_subnets = local.public_subnets_cidr_blocks # CIDR blocks for public subnets

  enable_dns_hostnames = true # Enable DNS hostnames
  enable_dns_support   = true # Enable DNS support
  tags = {
    Environment = local.env
  }

  # Define Internet Gateway inside the VPC module
  create_igw = true # Enable creation of Internet Gateway within the VPC module
}
