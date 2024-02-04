# Initialize Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

# Configure the AWS provider

provider "aws" {
  region = var.region

}

module "vpc" {

  source = "../modules/vpc"
  
  #vpc

  vpc_cidr_block = var.vpc_cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  vpcname = var.vpcname

  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks

  igwname = var.igwname

  rtname = var.rtname

  naclname = var.naclname

}

module "security_groups" {

  source = "../modules/sg"

  sgname = var.sgname
  vpc_cidr_block = var.vpc_cidr_block
  vpcid = module.vpc.vpc_id
  
  
}


module "eks_cluster" {

  source = "../modules/eks"

  eks_cluster_name = var.eks_cluster_name
  public_subnet_ids = module.vpc.public_subnet_ids
 
}
module "load_balancer" {

  source = "../modules/alb"
  alb_name = var.alb_name
  internal = var.internal
  load_balancer_type = var.load_balancer_type
  public_subnet_ids = module.vpc.public_subnet_ids
  enable_deletion_protection = var.enable_deletion_protection
  security_groupid = module.security_groups.security_group_id

}

