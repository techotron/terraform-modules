output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.alb.lb_dns_name
}