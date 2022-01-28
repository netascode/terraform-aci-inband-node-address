terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
}

module "main" {
  source = "../.."

  node_id        = 201
  pod_id         = 2
  ip             = "10.1.1.100/24"
  gateway        = "10.1.1.254"
  endpoint_group = "INB1"
}

data "aci_rest_managed" "mgmtRsInBStNode" {
  dn = "uni/tn-mgmt/mgmtp-default/inb-INB1/rsinBStNode-[topology/pod-2/node-201]"

  depends_on = [module.main]
}

resource "test_assertions" "mgmtRsInBStNode" {
  component = "mgmtRsInBStNode"

  equal "addr" {
    description = "addr"
    got         = data.aci_rest_managed.mgmtRsInBStNode.content.addr
    want        = "10.1.1.100/24"
  }

  equal "gw" {
    description = "gw"
    got         = data.aci_rest_managed.mgmtRsInBStNode.content.gw
    want        = "10.1.1.254"
  }

  equal "tDn" {
    description = "tDn"
    got         = data.aci_rest_managed.mgmtRsInBStNode.content.tDn
    want        = "topology/pod-2/node-201"
  }
}
