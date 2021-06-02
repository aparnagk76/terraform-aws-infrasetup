output nginx-lb_ip {
    value = aws_instance.nginx-lb.public_ip
}

output nginx-private_ip-1 {
    value = aws_instance.private-nginx[0].private_ip
}
output nginx-private_ip-2 {
    value = aws_instance.private-nginx[1].private_ip
}