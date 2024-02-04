

variable "alb_name" {
  type    = string
 
}

variable "internal" {
  type    = string
 
}

variable "load_balancer_type" {
  type    = string
  default = "application"
}

variable "enable_deletion_protection" {
  type    = string
}

variable "public_subnet_ids" {
  type = list
}
variable "security_groupid" {
  type = string
  
}