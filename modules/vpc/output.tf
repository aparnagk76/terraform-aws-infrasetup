output "vpc_id" {
  value = aws_vpc.aparnavpc.id
}
output "public_subnet_id" {
  value = aws_subnet.main.id
}


output "private_subnet_id" {
  value = aws_subnet.internal.id
}
