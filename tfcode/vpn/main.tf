## S-S VPN Tunnels CW Log group creation
resource "aws_cloudwatch_log_group" "vpn_tunnel1_cwlog" {
  name = "/aws/vpn/${var.tunnel_name}/tunnel1"
  retention_in_days = 7
  tags = merge(
    { "Name" = "${var.name_prefix}-vpn_tunnel1_cwlog"},
    var.additional_tags
  )
}

resource "aws_cloudwatch_log_group" "vpn_tunnel2_cwlog" {
  name = "/aws/vpn/${var.tunnel_name}/tunnel2"
  retention_in_days = 7
  tags = merge(
    { "Name" = "${var.name_prefix}-vpn_tunnel2_cwlog"},
    var.additional_tags
  )
}

#aws vpn customer gateway setup
resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn         = var.customer_gateway_bgp_asn
  ip_address      = var.customer_gateway_ip_address
  type            = var.customer_gateway_type
  device_name     = var.customer_gateway_device_name
  # certificate_arn = var.customer_gateway_certificate_arn

  tags = merge(
    { "Name" = "${var.name_prefix}-customer_gateway"},
    var.additional_tags
  )
}

#aws vpgw setup
resource "aws_vpn_gateway" "virtual_private_gateways" {
  vpc_id            = var.virtual_private_gateways_vpc_id
  amazon_side_asn   = var.virtual_private_gateways_amazon_side_asn
  availability_zone = var.virtual_private_gateways_availability_zone

  tags = merge(
    { "Name" = "${var.name_prefix}-virtual_private_gateways"},
    var.additional_tags
  )
  }

# aws vpgw attachment to vpc
resource "aws_vpn_gateway_route_propagation" "route_propagation" {
  count          = length(var.route_propagation_route_table_ids)
  vpn_gateway_id = join("", aws_vpn_gateway.virtual_private_gateways.*.id)
  route_table_id = element(var.route_propagation_route_table_ids, count.index)
}

#aws s-s vpn using vpgw setup
resource "aws_vpn_connection" "vpn_connection" {
  vpn_gateway_id = aws_vpn_gateway.virtual_private_gateways.id
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  type = var.customer_gateway_type
  static_routes_only = var.vpn_connection_static_routes_only  

###vpn_connection_tunnel
  # tunnel_inside_ip_version = var.vpn_connection_tunnel_inside_ip_version
  # tunnel1_inside_cidr                  = var.vpn_connection_tunnel1_inside_cidr
  tunnel1_preshared_key                = var.vpn_connection_tunnel1_preshared_key
  tunnel1_dpd_timeout_action           = var.vpn_connection_tunnel1_dpd_timeout_action
  tunnel1_dpd_timeout_seconds          = var.vpn_connection_tunnel1_dpd_timeout_seconds
  tunnel1_ike_versions                 = var.vpn_connection_tunnel1_ike_versions
  tunnel1_phase1_dh_group_numbers      = var.vpn_connection_tunnel1_phase1_dh_group_numbers
  tunnel1_phase1_encryption_algorithms = var.vpn_connection_tunnel1_phase1_encryption_algorithms
  tunnel1_phase1_integrity_algorithms  = var.vpn_connection_tunnel1_phase1_integrity_algorithms
  tunnel1_phase1_lifetime_seconds      = var.vpn_connection_tunnel1_phase1_lifetime_seconds
  tunnel1_phase2_dh_group_numbers      = var.vpn_connection_tunnel1_phase2_dh_group_numbers
  tunnel1_phase2_encryption_algorithms = var.vpn_connection_tunnel1_phase2_encryption_algorithms
  tunnel1_phase2_integrity_algorithms  = var.vpn_connection_tunnel1_phase2_integrity_algorithms
  tunnel1_phase2_lifetime_seconds      = var.vpn_connection_tunnel1_phase2_lifetime_seconds
  tunnel1_rekey_fuzz_percentage        = var.vpn_connection_tunnel1_rekey_fuzz_percentage
  tunnel1_rekey_margin_time_seconds    = var.vpn_connection_tunnel1_rekey_margin_time_seconds
  tunnel1_replay_window_size           = var.vpn_connection_tunnel1_replay_window_size
  tunnel1_startup_action               = var.vpn_connection_tunnel1_startup_action
  tunnel1_log_options {
    dynamic "cloudwatch_log_options" {
      for_each = var.tunnel1_log_options
      content {
        log_enabled       = cloudwatch_log_options.value.log_enabled
        log_group_arn     = aws_cloudwatch_log_group.vpn_tunnel1_cwlog.arn
        log_output_format = cloudwatch_log_options.value.log_output_format
      }
    }
  }

  # tunnel2_inside_cidr                  = var.vpn_connection_tunnel2_inside_cidr
  tunnel2_preshared_key                = var.vpn_connection_tunnel2_preshared_key
  tunnel2_dpd_timeout_action           = var.vpn_connection_tunnel2_dpd_timeout_action
  tunnel2_dpd_timeout_seconds          = var.vpn_connection_tunnel2_dpd_timeout_seconds
  tunnel2_ike_versions                 = var.vpn_connection_tunnel2_ike_versions
  tunnel2_phase1_dh_group_numbers      = var.vpn_connection_tunnel2_phase1_dh_group_numbers
  tunnel2_phase1_encryption_algorithms = var.vpn_connection_tunnel2_phase1_encryption_algorithms
  tunnel2_phase1_integrity_algorithms  = var.vpn_connection_tunnel2_phase1_integrity_algorithms
  tunnel2_phase1_lifetime_seconds      = var.vpn_connection_tunnel2_phase1_lifetime_seconds
  tunnel2_phase2_dh_group_numbers      = var.vpn_connection_tunnel2_phase2_dh_group_numbers
  tunnel2_phase2_encryption_algorithms = var.vpn_connection_tunnel2_phase2_encryption_algorithms
  tunnel2_phase2_integrity_algorithms  = var.vpn_connection_tunnel2_phase2_integrity_algorithms
  tunnel2_phase2_lifetime_seconds      = var.vpn_connection_tunnel2_phase2_lifetime_seconds
  tunnel2_rekey_fuzz_percentage        = var.vpn_connection_tunnel2_rekey_fuzz_percentage
  tunnel2_rekey_margin_time_seconds    = var.vpn_connection_tunnel2_rekey_margin_time_seconds
  tunnel2_replay_window_size           = var.vpn_connection_tunnel2_replay_window_size
  tunnel2_startup_action               = var.vpn_connection_tunnel2_startup_action
  tunnel2_log_options {
    dynamic "cloudwatch_log_options" {
      for_each = var.tunnel2_log_options
      content {
        log_enabled       = cloudwatch_log_options.value.log_enabled
        log_group_arn     = aws_cloudwatch_log_group.vpn_tunnel2_cwlog.arn
        log_output_format = cloudwatch_log_options.value.log_output_format
      }      
    }
  }

  tags = merge(
    { "Name" = "${var.name_prefix}-vpn_connection"},
    var.additional_tags
  )
}

# resource "aws_vpn_connection_route" "vpn_connection_route" {
#   count                  = var.virtual_private_gateways_availability_zone == null ? 0 : length(var.vpn_connection_route_destination_cidr_block)
#   destination_cidr_block = element(var.vpn_connection_route_destination_cidr_block, count.index)
#   vpn_connection_id      = aws_vpn_connection.vpn_connection.id
# }


resource "aws_vpn_connection_route" "vpn_connection_route" {
  destination_cidr_block = var.vpn_connection_route_destination_cidr_block
  vpn_connection_id = aws_vpn_connection.vpn_connection.id
}
