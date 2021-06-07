output nginx-lb {
    value = module.ec2.nginx-lb_ip
}

output nginx-private-1 {
    value = module.ec2.nginx-private_ip-1
}
output nginx-private-2 {
    value = module.ec2.nginx-private_ip-2
}