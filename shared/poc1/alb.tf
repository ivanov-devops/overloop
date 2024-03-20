module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.8.0"
  name    = local.alb_name # Name of the ALB
  subnets = module.vpc.public_subnets # Subnets where ALB should be deployed
  tags    = local.common_tags
}

# Resource for creating a listener on the ALB
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = module.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward" # Forward traffic to a target group
    target_group_arn = aws_lb_target_group.web_server_target_group.arn # ARN of the target group
  }
}

# Resource for creating a target group for web servers
resource "aws_lb_target_group" "web_server_target_group" {
  name     = "web-server-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  tags = local.common_tags
}

# Resource for attaching EC2 instances to the target group
resource "aws_lb_target_group_attachment" "ec2_target_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.web_server_target_group.arn
  target_id        = module.ec2-instance[count.index].id
}
