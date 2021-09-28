module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "${var.app}-${var.environment}-alb"

  load_balancer_type         = "application"
  internal                   = false
  enable_deletion_protection = false
  vpc_id                     = data.aws_vpc.vpc.id
  subnets                    = [for s in data.aws_subnet.subnets : s.id]
  security_groups            = [data.aws_security_group.external_http_sg.id, data.aws_security_group.internal_allow_sg.id]

  target_groups = [
    {
      name             = "${var.app}-${var.environment}-tg"
      target_type      = var.lb_targetgroup_type
      backend_protocol = "HTTP"
      backend_port     = 80

      health_check = {
        path              = "/health"
        interval          = 10
        healthy_threshold = 3
        timeout           = 5
      }

      slow_start           = 60
      deregistration_delay = 60
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    built_by                = "terraform"
    app                     = var.app
    environment             = var.environment
  }
}
