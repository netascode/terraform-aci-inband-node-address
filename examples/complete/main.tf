module "aci_inband_node_address" {
  source  = "netascode/inband-node-address/aci"
  version = ">= 0.0.3"

  node_id        = 201
  pod_id         = 2
  ip             = "10.1.1.100/24"
  gateway        = "10.1.1.254"
  endpoint_group = "INB1"
}
