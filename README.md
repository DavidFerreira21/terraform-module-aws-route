
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.70.0 |
# Examples

``` hcl
module "route_private" {
  source             = "../modules/route"
  create_route_table = false
  route_table_id     = module.vpc.private_route_table_ids[0]

  routes = {
    VPN = {
      destination_cidr_block = var.destination_cidr_block
      gateway_id             = module.vpc.vpn_gateway_id
    }
  }

}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_route_table"></a> [create\_route\_table](#input\_create\_route\_table) | If true a new route table will be created | `bool` | `false` | no |
| <a name="input_route_table"></a> [route\_table](#input\_route\_table) | A mapping of tags to assign to the resource | `map(any)` | `{}` | no |
| <a name="input_route_table_id"></a> [route\_table\_id](#input\_route\_table\_id) | list of route table ids | `string` | `""` | no |
| <a name="input_routes"></a> [routes](#input\_routes) | A mapping of routes, Attributes: destination\_cidr\_block,vpc\_peering\_connection\_id,gateway\_id,nat\_gateway\_id,transit\_gateway\_id and vpc\_endpoint\_id | `map(map(any))` | `{}` | no |
| <a name="input_rt_name"></a> [rt\_name](#input\_rt\_name) | Name of route table | `string` | `""` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | list of subnet ids | `list(string)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | id of vpc | `string` | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | id of route table |
## Resources

| Name | Type |
|------|------|
| [aws_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |

