module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.31.6"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

cluster_endpoint_public_access = true


  eks_managed_node_groups = {
    terraweek_nodes = {
      ami_type       = "AL2_x86_64"
      instance_types = [var.node_instance_type]

      min_size     = 1
      max_size     = 3
      desired_size = var.node_desired_count
    }
  }
}

resource "aws_eks_access_entry" "admin" {
  cluster_name  = "terraweek-eks"
  principal_arn = "arn:aws:iam::163053485065:user/terraform-uset"
}

resource "aws_eks_access_policy_association" "admin_policy" {
  cluster_name  = "terraweek-eks"
  principal_arn = "arn:aws:iam::163053485065:user/terraform-uset"

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}