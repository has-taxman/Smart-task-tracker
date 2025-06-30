output "app_alb_arn" {
  value = aws_lb.app_alb.arn
}

output "app_alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "app_alb_zone_id" {
  value = aws_lb.app_alb.zone_id
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}
