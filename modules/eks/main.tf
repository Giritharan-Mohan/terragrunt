
# Create EKS Cluster
resource "aws_eks_cluster" "eks" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.iamrole.arn

  vpc_config {
    subnet_ids = var.public_subnet_ids
    # aws_subnet.public[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.ekspolicy,
    aws_iam_role_policy_attachment.eksrc,
  ]
}


data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iamrole" {
  name               = "eks-cluster-iamrole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ekspolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.iamrole.name
}

resource "aws_iam_role_policy_attachment" "eksrc" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.iamrole.name
}
