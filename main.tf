data "alkira_group_connector" "group" {
  name = var.alk_group
}

data "alkira_segment" "segment" {
  name = var.alk_segment
}

resource "alkira_connector_ipsec" "ipsec" {
  name           = var.name
  cxp            = var.cxp
  size           = var.size
  group          = data.alkira_group_connector.group.name
  segment_id     = data.alkira_segment.segment.id

  vpn_mode       = "ROUTE_BASED"

  routing_options {
    type = "DYNAMIC"
    customer_gateway_asn = var.asn
  }

  endpoint {
      name                 = var.name
      customer_gateway_ip  = var.gateway
      preshared_keys       = [var.psk, var.psk]
  }
}

