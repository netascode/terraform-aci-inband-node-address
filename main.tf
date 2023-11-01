resource "aci_rest_managed" "mgmtRsInBStNode" {
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${var.endpoint_group}/rsinBStNode-[topology/pod-${var.pod_id}/node-${var.node_id}]"
  class_name = "mgmtRsInBStNode"
  content = {
    addr   = var.ip
    gw     = var.gateway
    v6Addr = var.v6_ip
    v6Gw   = var.v6_gateway
    tDn    = "topology/pod-${var.pod_id}/node-${var.node_id}"
  }
}
