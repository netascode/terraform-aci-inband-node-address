module "aci_inband_node_address" {
  source = "netascode/inband-node-address/aci"

  node_id        = 101
  pod            = 1
  address        = "10.1.1.100/24"
  gateway        = "10.1.1.254"
  endpoint_group = "INB1"
}
