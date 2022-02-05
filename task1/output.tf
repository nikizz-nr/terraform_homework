
output "all_vpcs" {
  value = data.aws_vpcs.all_vpcs.ids
}

output "all_subnets" {
  value = data.aws_subnets.all_subnets.ids
}

output "all_sg" {
  value = data.aws_security_groups.all_sg.ids
}
