output "public_subnet_id" {
    value = aws_subnet.main.id
}

output "private_subnet_id" {
    value = aws_subnet.internal.id
}

output "vpc_id" {
    value = aws_vpc.aparnavpc.id
}