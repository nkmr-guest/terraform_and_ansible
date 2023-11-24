output "vpc_id" {
  value = aws_vpc.MyFirstVPC.id
}
output "vpc_cidr" {
  value = aws_vpc.MyFirstVPC.cidr_block
}

output "public_subnet_id" {
  value = aws_subnet.public[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private[*].id
}
