#########################################
# EKS Managed Node Group
#########################################

resource "aws_eks_node_group" "main" {

  cluster_name = aws_eks_cluster.main.name

  node_group_name = "${var.project_name}-${var.environment}-nodes"

  node_role_arn = aws_iam_role.worker_nodes.arn

  subnet_ids = [

    aws_subnet.private_1.id,

    aws_subnet.private_2.id

  ]

  scaling_config {

    desired_size = 1

    max_size = 2

    min_size = 1

  }

  instance_types = ["t3.small"]

  capacity_type = "ON_DEMAND"

  ami_type = "AL2023_x86_64_STANDARD"

  depends_on = [

    aws_iam_role_policy_attachment.worker_node_policy,

    aws_iam_role_policy_attachment.cni_policy,

    aws_iam_role_policy_attachment.ecr_readonly,

    aws_eks_addon.vpc_cni,

  ]

  tags = merge(

    var.project_tags,

    {

      Name = "${var.project_name}-${var.environment}-node-group"

    }

  )

}
