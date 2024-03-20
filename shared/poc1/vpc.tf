data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.6.0"

  name = local.vpc_name
  cidr = local.vpc_cidr_block

  azs            = data.aws_availability_zones.available.names
  public_subnets = local.public_subnets_cidr_blocks

  enable_nat_gateway     = false
  single_nat_gateway     = false
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = local.env
  }
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id

  tags = local.common_tags
}
