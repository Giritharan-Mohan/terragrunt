

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer (ALB)"
  value       = aws_lb.alb.dns_name
}

output "alb_arn" {
  description = "The ARN (Amazon Resource Name) of the Application Load Balancer (ALB)"
  value       = aws_lb.alb.arn
}
