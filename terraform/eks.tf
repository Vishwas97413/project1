#########################################
# Amazon EKS Cluster
#########################################

resource "aws_eks_cluster" "main" {

  name = "${var.project_name}-${var.environment}-eks"

  role_arn = aws_iam_role.eks_cluster.arn

  version = "1.31"

  vpc_config {

    subnet_ids = [

      aws_subnet.public_1.id,

      aws_subnet.public_2.id,

      aws_subnet.private_1.id,

      aws_subnet.private_2.id

    ]

    security_group_ids = [

      aws_security_group.eks_cluster.id

    ]

    endpoint_private_access = true

    endpoint_public_access = true

  }

  depends_on = [

    aws_iam_role_policy_attachment.eks_cluster_policy

  ]

  tags = merge(

    var.project_tags,

    {

      Name = "${var.project_name}-${var.environment}-eks"

    }

  )

}
