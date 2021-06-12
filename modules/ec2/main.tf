
data aws_ami amazon-linux2 {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource aws_security_group allow_ssh {
  name        = "allow_ssh_tcp"
  description = "allow ports for nginx demo"
  vpc_id      = var.vpc_id

  ingress {
    cidr_blocks = var.ingress_cidr_blocks
    description = "allow port 22"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    cidr_blocks = var.ingress_cidr_blocks
    description = "allow port 80"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  egress {
    cidr_blocks = var.egress_cidr_blocks
    description = "allow traffic outside to internet"
    from_port   = 0
    protocol    = -1
    to_port     = 0
  }
}

resource aws_instance nginx-lb {
  ami                         = data.aws_ami.amazon-linux2.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)
  }
  provisioner remote-exec {
    inline = [
      "sudo amazon-linux-extras enable nginx1",
      "sudo yum install nginx -y",
      "sudo systemctl -l enable nginx",
      "sudo systemctl -l start nginx"
    ]
  }
}


resource aws_instance private-nginx {
  ami                         = data.aws_ami.amazon-linux2.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.private_subnet_id
  count                       = var.backend_instance_count
  associate_public_ip_address = false
  connection {
    type        = "ssh"
    host        = self.private_ip
    user        = "ec2-user"
    private_key = file(var.private_key_path)

    bastion_host        = aws_instance.nginx-lb.public_ip
    bastion_user        = "ec2-user"
    bastion_host_key    = var.key_name
    bastion_private_key = file(var.private_key_path)
  }
  provisioner remote-exec {
    inline = [
      "sudo amazon-linux-extras enable nginx1",
      "sudo yum install nginx -y",
      "sudo systemctl -l enable nginx",
      "sudo systemctl -l start nginx"
    ]
  }
}
 