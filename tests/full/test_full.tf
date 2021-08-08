terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  node_id        = 101
  pod            = 1
  address        = "10.1.1.100/24"
  gateway        = "10.1.1.254"
  endpoint_group = "INB1"
}

data "aci_rest" "mgmtRsInBStNode" {
  dn = "uni/tn-mgmt/mgmtp-default/inb-INB1/rsinBStNode-[topology/pod-1/node-101]"

  depends_on = [module.main]
}

resource "test_assertions" "mgmtRsInBStNode" {
  component = "mgmtRsInBStNode"

  equal "addr" {
    description = "addr"
    got         = data.aci_rest.mgmtRsInBStNode.content.addr
    want        = "10.1.1.100/24"
  }

  equal "gw" {
    description = "gw"
    got         = data.aci_rest.mgmtRsInBStNode.content.gw
    want        = "10.1.1.254"
  }

  equal "tDn" {
    description = "tDn"
    got         = data.aci_rest.mgmtRsInBStNode.content.tDn
    want        = "topology/pod-1/node-101"
  }
}
