# Define a security group for web servers
resource "aws_security_group" "web_sg" {
  name        = local.security_group_name
  description = "Allow HTTP traffic"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags

  ingress {
    from_port   = local.ingress_rules[0].from_port
    to_port     = local.ingress_rules[0].to_port
    protocol    = local.ingress_rules[0].protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Output the security group ID for reference
output "security_group_id" {
  value = aws_security_group.web_sg.id
}
