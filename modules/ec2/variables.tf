variable ingress_cidr_blocks {
  type        = list(string)
  description = "list of cidr blocks to allow incoming traffic"
  default     = ["0.0.0.0/0"]
}

variable egress_cidr_blocks {
  type        = list(string)
  description = "list of cidr blocks to allow outgoing traffic"
  default     = ["0.0.0.0/0"]
}

variable instance_type {
  type        = string
  description = "the type of ec2 instance"
  default     = "t2.micro"
}

variable key_name {
  type        = string
  description = "the name of a key"
  default     = "aparna1"
}

variable private_key_path {
  type        = string
  description = "the path of a private key"
  default     = "~/.ssh/aparna1.pem"
}

variable backend_instance_count {
  type        = number
  description = "the count of backend ec2 instances"
  default     = 2
}

variable vpc_id {
  type = string
  description = "vpc id"
}

variable "public_subnet_id" {
    type = string
    description = "public subnet id"
}

variable "private_subnet_id" {
    type = string
    description = "private subnet id"
}