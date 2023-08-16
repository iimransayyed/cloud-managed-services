output "vpn_tunnel1_cwlog_id" {
  value = aws_cloudwatch_log_group.vpn_tunnel1_cwlog.id
}

output "vpn_tunnel2_cwlog_id" {
  value = aws_cloudwatch_log_group.vpn_tunnel2_cwlog.id
}

output "vpn_tunnel1_cwlog_arn" {
  value = aws_cloudwatch_log_group.vpn_tunnel1_cwlog.arn
}

output "vpn_tunnel2_cwlog_arn" {
  value = aws_cloudwatch_log_group.vpn_tunnel2_cwlog.arn
}

output "aws_customer_gateway_arn" {
  value = aws_customer_gateway.customer_gateway.arn

}

output "aws_customer_gateway_id" {
  value = aws_customer_gateway.customer_gateway.id

}

output "aws_vpn_gateway_arn" {
  value = aws_vpn_gateway.virtual_private_gateways.arn
}

output "aws_vpn_gateway_id" {
  value = aws_vpn_gateway.virtual_private_gateways.id
}

output "aws_vpn_connection_arn" {
  value = aws_vpn_connection.vpn_connection.*.arn
}

output "aws_vpn_connection_id" {
  value = aws_vpn_connection.vpn_connection.*.id
}