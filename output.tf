output nginx-lb {
  value = module.ec2.nginx-lb
}

output nginx-private-1 {
  value = module.ec2.nginx-private-1
}
output nginx-private-2 {
  value = module.ec2.nginx-private-2
}