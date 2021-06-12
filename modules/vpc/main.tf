# create a vpc
resource aws_vpc aparnavpc {
  cidr_block = var.vpc_cidr_block

  tags = {
    name = var.environment_name
  }
}
# create an internet gateway

resource aws_internet_gateway gw {
  vpc_id = aws_vpc.aparnavpc.id
}

# create a nat 

resource aws_eip nat {
  vpc = true
}

# create a nat gateway

resource aws_nat_gateway nat-gw {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.main.id

}

# create route table
resource aws_route_table r {
  vpc_id = aws_vpc.aparnavpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# create private route table

resource aws_route_table private-rta {
  vpc_id = aws_vpc.aparnavpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id

  }
}

# create a private route table association

resource aws_route_table_association private-rta {
  subnet_id      = aws_subnet.internal.id
  route_table_id = aws_route_table.private-rta.id
}
# create a route table association
resource aws_route_table_association rta {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.r.id
}


# Create a public subnet

resource aws_subnet main {
  vpc_id     = aws_vpc.aparnavpc.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 1)
  tags = {
    name = var.environment_name
  }
}

#create a private subnet

resource aws_subnet internal {
  vpc_id     = aws_vpc.aparnavpc.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 2)
  tags = {
    name = var.environment_name
  }
}
