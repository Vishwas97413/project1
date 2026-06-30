output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_1" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2" {
  value = aws_subnet.public_2.id
}

output "private_subnet_1" {
  value = aws_subnet.private_1.id
}

output "private_subnet_2" {
  value = aws_subnet.private_2.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}

output "eks_cluster_security_group" {

  value = aws_security_group.eks_cluster.id

}

output "worker_node_security_group" {

  value = aws_security_group.worker_nodes.id

}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster.arn
}

output "worker_node_role_arn" {
  value = aws_iam_role.worker_nodes.arn
}

output "eks_cluster_name" {
  value = aws_eks_cluster.main.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "eks_cluster_version" {
  value = aws_eks_cluster.main.version
}

output "node_group_name" {
  value = aws_eks_node_group.main.node_group_name
}
