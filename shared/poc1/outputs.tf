output "alb_dns_name" {
  value = module.alb.dns_name
}
output "internet_gateway_id" {
  description = "The Internet Gateway ID"
  value       = module.vpc.igw_id
}

# Output public subnets
output "public_subnets" {
  value = module.vpc.public_subnets
}
