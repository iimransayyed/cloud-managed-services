customer_gateway_bgp_asn    = 65000
customer_gateway_ip_address = "172.83.124.10"
customer_gateway_type       = "ipsec.1" #(Required) The only type AWS supports at this time is ipsec.1
# customer_gateway_certificate_arn = "arn:aws:acm:ap-southeast-1:111111111111:certificate/365ac088-d023-4690-aa8e-6e4831a73332"
customer_gateway_device_name = "demo_customer_gateway"
tags = {
  "Name" = "demo_customer_gateway"
}
virtual_private_gateways_vpc_id = "vpc-0e803f043a895b9fd"
virtual_private_gateways_amazon_side_asn = 65001
route_propagation_route_table_ids       = ["rtb-0108d5e6f384f8f8f"]

##vpn_connection_tunnel
# vpn_connection_tunnel_inside_ip_version = "ipv6"
# vpn_connection_tunnel1_inside_cidr = "169.254.253.152/30"
# vpn_connection_tunnel2_inside_cidr = "169.254.116.244/30"
vpn_connection_tunnel1_dpd_timeout_action = "clear"
vpn_connection_tunnel2_dpd_timeout_action = "clear"
vpn_connection_tunnel1_ike_versions       = ["ikev1"]
vpn_connection_tunnel2_ike_versions       = ["ikev2"]
tunnel1_log_options = [{
  log_enabled       = true
  log_group_arn     = "arn:aws:logs:ap-southeast-1:061058055367:log-group:/aws/vpn/s-s-vpn-xyz/tunnel1:*"
  log_output_format = "text"
}]
tunnel2_log_options = [{
  log_enabled       = true
  log_group_arn     = "arn:aws:logs:ap-southeast-1:061058055367:log-group:/aws/vpn/s-s-vpn-xyz/tunnel2:*"
  log_output_format = "json"
}]
vpn_connection_tunnel1_phase1_dh_group_numbers      = [2]
vpn_connection_tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]
vpn_connection_tunnel1_phase1_encryption_algorithms = ["AES128"]
vpn_connection_tunnel1_phase2_dh_group_numbers      = ["2"]
vpn_connection_tunnel2_phase1_dh_group_numbers      = [2]
vpn_connection_tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]
vpn_connection_tunnel2_phase1_encryption_algorithms = ["AES128"]
vpn_connection_tunnel1_phase1_lifetime_seconds      = 1000
vpn_connection_tunnel2_phase1_lifetime_seconds      = 1000
vpn_connection_tunnel2_phase2_dh_group_numbers      = ["2"]
vpn_connection_tunnel1_phase2_encryption_algorithms = ["AES128"]
vpn_connection_tunnel2_phase2_encryption_algorithms = ["AES128"]
vpn_connection_tunnel1_phase2_integrity_algorithms  = ["SHA2-256"]
vpn_connection_tunnel2_phase2_integrity_algorithms  = ["SHA2-256"]
vpn_connection_tunnel1_phase2_lifetime_seconds      = 1000
vpn_connection_tunnel2_phase2_lifetime_seconds      = 1000
vpn_connection_tunnel1_rekey_fuzz_percentage        = 100
vpn_connection_tunnel2_rekey_fuzz_percentage        = 100
vpn_connection_tunnel1_rekey_margin_time_seconds    = 60
vpn_connection_tunnel2_rekey_margin_time_seconds    = 60
vpn_connection_tunnel1_replay_window_size           = 64
vpn_connection_tunnel2_replay_window_size           = 64
vpn_connection_tunnel1_startup_action               = "add"
vpn_connection_tunnel2_startup_action               = "add"

#vpn_connection_static_route
vpn_connection_route_destination_cidr_block = "192.168.10.0/24"
# vpn_connection_route_destination_cidr_block = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]