module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name          = local.ec2_instance_name
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = local.ec2_instance_type
  count         = 2
  subnet_id     = module.vpc.public_subnets[0]

  # Reference the security group created in security_groups.tf
  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  associate_public_ip_address = true
  user_data                   = file("${path.module}/user_data_nginx.sh")

  tags = local.common_tags
}
