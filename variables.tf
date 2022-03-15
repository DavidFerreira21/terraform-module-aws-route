variable "vpc_id" {
  description = "id of vpc"
  type        = string
  default     = ""
}

variable "create_route_table" {
  description = "If true a new route table will be created"
  type        = bool
  default     = false
}

variable "route_table" {
  description = "A mapping of tags to assign to the resource"
  type        = map(any)
  default     = {}
}

variable "rt_name" {
  description = "Name of route table"
  type        = string
  default     = ""
}

variable "subnets" {
  description = "list of subnet ids"
  type        = list(string)
  default     = []
}


variable "route_table_id" {
  description = "list of route table ids"
  type        = string
  default     = ""
}

variable "routes" {
  description = "A mapping of routes, Attributes: destination_cidr_block,vpc_peering_connection_id,gateway_id,nat_gateway_id,transit_gateway_id and vpc_endpoint_id"
  type        = map(map(any))
  default     = {}
}