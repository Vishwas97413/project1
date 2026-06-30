#########################################
# EKS Cluster Security Group
#########################################

resource "aws_security_group" "eks_cluster" {

  name = "${var.project_name}-${var.environment}-eks-cluster-sg"

  description = "Security Group for EKS Control Plane"

  vpc_id = aws_vpc.main.id

  ingress {

    description = "HTTPS"

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = merge(
    var.project_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks-cluster-sg"
    }
  )

}

#########################################
# Worker Node Security Group
#########################################

resource "aws_security_group" "worker_nodes" {

  name = "${var.project_name}-${var.environment}-worker-node-sg"

  description = "Security Group for Worker Nodes"

  vpc_id = aws_vpc.main.id

  ingress {

    description = "Node Communication"

    from_port = 0

    to_port = 65535

    protocol = "tcp"

    self = true

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = merge(
    var.project_tags,
    {
      Name = "${var.project_name}-${var.environment}-worker-node-sg"
    }
  )

}
