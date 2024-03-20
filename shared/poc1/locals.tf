locals {
  common_tags = {
    Environment = "dev"
  }

# AWS profile and region configuration
  aws_profile = "mmstat"
  aws_region  = "eu-west-1"
  env         = "infra"

  # Default tags applied to resources
  default_tags = {
    Project     = "overloop"
    Environment = "infra"
    Terraform   = "true"
  }
 # VPC configuration
  vpc_name                   = "Demo-VPC"
  vpc_cidr_block             = "10.0.0.0/16"
  availability_zones         = ["eu-west-1a", "eu-west-1b"]
  public_subnets_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  # Security group configuration
  security_group_name = "web_sg"
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
    }
  ]

  # EC2 instance configuration
  ec2_instance_name = "web_server"
  ec2_instance_type = "t2.micro"

  # ALB configuration
  alb_name              = "my-alb"
  target_group_name     = "web-server-target-group" # Adjusted target group name
  target_group_port     = 80
  target_group_protocol = "HTTP"
}
