# providers.tf
provider "aws" {
  profile = local.aws_profile
  region  = local.aws_region
  default_tags {
    tags = {
      Terraform = "true"
    }
  }
}
