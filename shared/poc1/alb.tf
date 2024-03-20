module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.8.0"
  name    = local.alb_name
  subnets = module.vpc.public_subnets
  tags    = local.common_tags
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = module.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_server_target_group.arn
  }
}

resource "aws_lb_target_group" "web_server_target_group" {
  name     = "web-server-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  tags = local.common_tags
}

resource "aws_lb_target_group_attachment" "ec2_target_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.web_server_target_group.arn
  target_id        = module.ec2-instance[count.index].id
}
