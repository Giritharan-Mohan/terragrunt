

# output.tf

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_security_group_ids" {
  value = aws_eks_cluster.eks.vpc_config[0].security_group_ids
}

output "eks_cluster_subnets" {
  value = aws_eks_cluster.eks.vpc_config[0].subnet_ids
}

output "eks_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

