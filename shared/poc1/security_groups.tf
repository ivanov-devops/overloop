resource "aws_security_group" "web_sg" {
  name        = local.security_group_name
  description = "Allow HTTP traffic"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}
