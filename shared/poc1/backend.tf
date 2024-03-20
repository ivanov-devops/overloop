# Configuration for Terraform backend, specifying that state should be stored in an S3 bucket
terraform {
  backend "s3" {
    bucket         = "mmstat-shared-infrastructure-states" # Name of the S3 bucket to store Terraform state
    key            = "shared/poc/.terraform/terraform.tfstate" # Path to the state file within the bucket
    region         = "eu-west-1"
    dynamodb_table = "mmstat-shared-infrastructure-states-lock" # Name of the DynamoDB table for state locking
    encrypt        = true
  }
}
