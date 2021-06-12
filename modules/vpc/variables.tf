variable vpc_cidr_block {
  type        = string
  description = "vpc cidr_block"
  default     = "10.0.0.0/16"
}

variable environment_name {
  type        = string
  description = "the name of an environment"
  default     = "acme"
}

