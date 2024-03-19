locals {
  aws_profile = "mmstat"
  aws_region  = "eu-west-1"
  env         = "infra"
  default_tags = {
    Project     = "overloop"
    Environment = local.env
    Terraform   = "true"
  }
}
