terraform {
  backend "s3" {
    bucket         = "mmstat-shared-infrastructure-states"
    key            = "shared/poc/.terraform/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "mmstat-shared-infrastructure-states-lock"
    encrypt        = true
    profile        = "mmstat"
  }
}
