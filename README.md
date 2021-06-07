# terraform-aws-infrasetup
## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backend\_instance\_count | the count of backend ec2 instances | `number` | `2` | no |
| egress\_cidr\_blocks | list of cidr blocks to allow outgoing traffic | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| environment\_name | the name of an environment | `string` | `"acme"` | no |
| ingress\_cidr\_blocks | list of cidr blocks to allow incoming traffic | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| instance\_type | the type of ec2 instance | `string` | `"t2.micro"` | no |
| key\_name | the name of a key | `string` | `"aparna1"` | no |
| private\_key\_path | the path of a private key | `string` | `"~/.ssh/aparna1.pem"` | no |
| private\_subnet\_id | public subnet id | `string` | `"10.0.2.0/24"` | no |
| public\_subnet\_id | public subnet id | `string` | `"10.0.1.0/24"` | no |
| vpc\_cidr\_block | vpc cidr\_block | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| nginx-lb | n/a |
| nginx-private-1 | n/a |
| nginx-private-2 | n/a |

