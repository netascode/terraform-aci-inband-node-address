resource "aci_rest_managed" "mgmtInB" {
  dn         = "uni/tn-mgmt/mgmtp-default/inb-${var.endpoint_group}"
  class_name = "mgmtInB"
  content = {
    name = var.endpoint_group
  }
}

resource "aci_rest_managed" "mgmtRsInBStNode" {
  dn         = "${aci_rest_managed.mgmtInB.dn}/rsinBStNode-[topology/pod-${var.pod_id}/node-${var.node_id}]"
  class_name = "mgmtRsInBStNode"
  content = {
    addr = var.ip
    gw   = var.gateway
    tDn  = "topology/pod-${var.pod_id}/node-${var.node_id}"
  }
}
