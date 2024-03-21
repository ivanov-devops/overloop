module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name          = local.ec2_instance_name # Name of the EC2 instances
  ami           = data.aws_ami.amazon_linux_2.id # Amazon Linux 2 AMI ID
  instance_type = local.ec2_instance_type
  count         = 2 # Number of EC2 instances to create

  # Specify different subnet IDs for each instance
  subnet_id     = element(module.vpc.public_subnets, count.index)

  # Reference the security group created in security_groups.tf
  vpc_security_group_ids = [
    aws_security_group.web_sg.id # Security group ID for EC2 instances
  ]

  associate_public_ip_address = true
  user_data                   = file("${path.module}/user_data_nginx.sh") # User data script for Nginx install and run

  tags = local.common_tags
}
