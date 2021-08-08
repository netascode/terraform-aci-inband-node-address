<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-aci-inband-node-address/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-aci-inband-node-address/actions/workflows/test.yml)

# Terraform ACI Inband Node Address Module

Manages ACI Inband Node Address

Location in GUI:
`Tenants` » `mgmt` » `Node Management Addresses` » `Static Node Management Addresses`

## Examples

```hcl
module "aci_inband_node_address" {
  source = "netascode/inband-node-address/aci"

  node_id        = 101
  pod            = 1
  address        = "10.1.1.100/24"
  gateway        = "10.1.1.254"
  endpoint_group = "INB1"
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 0.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 0.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_node_id"></a> [node\_id](#input\_node\_id) | Node ID. | `number` | n/a | yes |
| <a name="input_pod"></a> [pod](#input\_pod) | Pod ID. | `number` | `1` | no |
| <a name="input_address"></a> [address](#input\_address) | Inband IP address. | `string` | n/a | yes |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | Inband gateway IP. | `string` | n/a | yes |
| <a name="input_endpoint_group"></a> [endpoint\_group](#input\_endpoint\_group) | Inband management endpoint group name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of `mgmtRsInBStNode` object. |

## Resources

| Name | Type |
|------|------|
| [aci_rest.mgmtInB](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.mgmtRsInBStNode](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
<!-- END_TF_DOCS -->