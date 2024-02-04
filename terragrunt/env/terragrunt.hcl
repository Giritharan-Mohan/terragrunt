terraform {
  source = "../../modules"
}

inputs = {
  region                        = "ap-south-1"
  vpc_cidr_block                = "10.0.0.0/16"
  enable_dns_support            = true
  enable_dns_hostnames          = true
  vpcname                       = "vpc"
  igwname                       = "Infra-igw"
  public_subnet_cidr_blocks     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_blocks    = ["10.0.3.0/24", "10.0.4.0/24"]
  rtname                        = "Infra-public-rt"
  naclname                      = "Infra-nacl"
  sgname                        = "Infra-sg"
  eks_cluster_name              = "eks-cluster"
  alb_name                      = "Infra-alb"
  internal                      = false
  load_balancer_type            = "application"
  enable_deletion_protection    = false
}


dependency "alb" {
  config_path = "./alb" 

  mock_outputs = {
  alb_dns_name = "mock-alb-dns-name"  
  alb_arn      = "mock-alb-arn"       
}
}

dependency "eks" {
  config_path = "./eks"

  mock_outputs = {
    eks_cluster_name = "mock-eks-cluster-name"
    eks_cluster_endpoint = "mock-eks-cluster-endpoint"
    eks_cluster_security_group_ids = ["mock-eks-security-group-id-1", "mock-eks-security-group-id-2"]
    eks_cluster_subnets = ["mock-eks-subnet-id-1", "mock-eks-subnet-id-2"]
    eks_endpoint = "mock-eks-endpoint"
    kubeconfig_certificate_authority_data = "mock-kubeconfig-certificate-authority-data"
  }
}

dependency "sg" {
  config_path = "./sg"

  mock_outputs = {
    security_group_id = "mock-sg-id"
  }
}

dependency "vpc" {
  config_path = "./vpc"

  mock_outputs = {
    vpc_id = "mock-vpc-id"
    public_subnet_ids = ["mock-public-subnet-id-1", "mock-public-subnet-id-2"]
    private_subnet_ids = ["mock-private-subnet-id-1", "mock-private-subnet-id-2"]
    network_acl_id = "mock-network-acl-id"
    vpc_cidr_block = "mock-vpc-cidr-block"
  }
}
