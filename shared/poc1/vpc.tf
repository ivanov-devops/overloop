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
}

# Output public subnets
output "public_subnets" {
  value = module.vpc.public_subnets
}

# Internet Gateway and attaching it to the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id

  tags = local.common_tags
}
