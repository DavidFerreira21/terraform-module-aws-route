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