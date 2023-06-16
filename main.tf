# Pull data for group & segment
data "alkira_group_connector" "group" {
  name = var.alk_group
}
data "alkira_segment" "segment" {
  name = var.alk_segment
}
#create ipsec connector (routed - bgp)
resource "alkira_connector_ipsec" "ipsec" {
  name           = var.connectorname
  cxp            = var.cxp
  group          = data.alkira_group_connector.group.name
  segment_id     = data.alkira_segment.segment.id
  size           = var.size

  vpn_mode       = "ROUTE_BASED"

  routing_options {
    type = "DYNAMIC"
    customer_gateway_asn = var.asn
    bgp_auth_key = var.bgpauthkey
  }

  # There could be multiple endpoints defined.
  endpoint {
    name                     = var.endpointname
    customer_gateway_ip      = var.gateway
    preshared_keys           = [var.psk, var.psk]
#   billing_tag_ids          = [alkira_billing_tag.tag1.id]
    enable_tunnel_redundancy = true

    # Optional advanced options could be specified per endpoint.
#    advanced_options {
# Ignore these advanced timers for now - not even exposed in the UI
#      dpd_delay   = 30
#     dpd_timeout = 150
#      esp_dh_group_numbers      = [var.dhgroup]
#      esp_encryption_algorithms = [var.encryption]
#      esp_integrity_algorithms  = [var.integrity]
# Ignore these advanced timers for now - not even exposed in the UI
#      esp_life_time             = 3960
#      esp_random_time           = 360
#      esp_rekey_time            = 3600
#      ike_dh_group_numbers      = [var.dhgroup]
#      ike_encryption_algorithms = [var.encryption]
#      ike_integrity_algorithms  = [var.integrity]
# Ignore these advanced timers for now - not even exposed in the UI
#      ike_over_time             = 2880
#      ike_random_time           = 2880
#      ike_rekey_time            = 28800
# IKE version hardcoded to IKEv2 for now - should add option in Gform + variable in the future
#      ike_version               = "IKEv2"
# Set Alkira to initiate the connection by default (I believe this initiator is referring to the remote site)
#      initiator          = false
# Leave default auth behavior in place (should use gateway IP)
#      local_auth_type    = "IP_ADDR"
#      local_auth_value   = "172.16.1.1"
#      remote_auth_type   = "IP_ADDR"
#      remote_auth_value  = "54.70.233.220"
# Also advanced option don't expose
#      replay_window_size = 32
#    }
  }
# Configure only a single site (endpoint) per connector, not sure how to handle multiple endpoints within the same connector (rarer use-case)
#  endpoint {
#      name                 = "Site2"
#      customer_gateway_ip  = "9.9.9.9"
#      preshared_keys       = ["1234", "1235"]
#      billing_tag_ids      = [alkira_billing_tag.tag1.id]
# }
}
