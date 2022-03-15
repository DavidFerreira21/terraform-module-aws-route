
resource "aws_route_table" "this" {
  count  = var.create_route_table ? 1 : 0
  vpc_id = var.vpc_id

  route {

    cidr_block         = lookup(var.route_table.value, "cidr_block", null)
    gateway_id         = lookup(var.route_table.value, "gateway_id", null)
    nat_gateway_id     = lookup(var.route_table.value, "nat_gateway_id", null)
    transit_gateway_id = lookup(var.route_table.value, "transit_gateway_id", null)
    vpc_endpoint_id    = lookup(var.route_table.value, "vpc_endpoint_id", null)

  }


  tags = {
    Name = "${var.rt_name}"
  }
}

resource "aws_route_table_association" "this" {
  count          = var.create_route_table ? length(var.subnets) : 0
  subnet_id      = element(var.subnets, count.index)
  route_table_id = aws_route_table.this[0].id
}


resource "aws_route" "this" {

  for_each = var.routes

  route_table_id            = var.route_table_id
  destination_cidr_block    = each.value.destination_cidr_block
  vpc_peering_connection_id = lookup(each.value, "vpc_peering_connection_id", null)
  gateway_id                = lookup(each.value, "gateway_id", null)
  nat_gateway_id            = lookup(each.value, "nat_gateway_id", null)
  transit_gateway_id        = lookup(each.value, "transit_gateway_id", null)
  vpc_endpoint_id           = lookup(each.value, "vpc_endpoint_id", null)



}