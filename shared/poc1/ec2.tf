module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name                      = local.ec2_instance_name
  ami                       = data.aws_ami.amazon_linux_2.id
  instance_type             = local.ec2_instance_type
  count                     = 2
  subnet_id                 = module.vpc.public_subnets[0]

  # Create a security group inline
  vpc_security_group_ids    = [
    aws_security_group.ec2_security_group.id
  ]

  associate_public_ip_address = true
  user_data                 = file("${path.module}/user_data_nginx.sh")

  tags = local.common_tags
}

resource "aws_security_group" "ec2_security_group" {
  name        = local.security_group_name
  description = "Allow HTTP traffic"

  # Define ingress rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
  }
}
