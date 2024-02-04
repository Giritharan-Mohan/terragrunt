# variables.tf

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type    = string
  default = true
}

variable "enable_dns_hostnames" {
  type    = string
  default = true
}

variable "vpcname" {
  type    = string
  default = "Infra-vpc"
}

variable "igwname" {
  type    = string
  default = "Infra-igw"
}

variable "public_subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "rtname" {
  type    = string
  default = "Infra-public-rt"
}

variable "naclname" {
  type    = string
  default = "Infra-nacl"
}

variable "sgname" {
  type    = string
  default = "Infra-sg"
}

variable "eks_cluster_name" {
  type    = string
  default = "eks-cluster"
}

variable "alb_name" {
  type    = string
  default = "Infra-alb"
}

variable "internal" {
  type    = string
  default = false
}

variable "load_balancer_type" {
  type    = string
  default = "application"
}

variable "enable_deletion_protection" {
  type    = string
  default = false
}

