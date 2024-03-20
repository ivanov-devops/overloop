resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = local.common_tags
}

resource "aws_route_table_association" "public_subnet_association" {
  for_each = { for idx, subnet_id in module.vpc.public_subnets : idx => subnet_id }

  subnet_id      = each.value
  route_table_id = aws_route_table.public.id
}
