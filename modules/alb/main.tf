
# Create Application Load Balancer
resource "aws_lb" "alb" {
  name                        = var.alb_name
  internal                    = var.internal
  load_balancer_type          = var.load_balancer_type
  security_groups             = [var.security_groupid]
  subnets                     = var.public_subnet_ids
  
  enable_deletion_protection  = var.enable_deletion_protection
}
