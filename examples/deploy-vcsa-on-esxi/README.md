
# Terraform vCenter

This Terraform module creates and deploys a vCenter Server Appliance on an ESXi host. Additional template files are in the module folder if deploying to a vCenter is required. 


## Acknowledgements

 - [Based on a module by Riverpoint Technology](https://github.com/rptcloud/terraform-vsphere-vcsa)

## To-do

- [] Support deploying to vCenter via variable
- [x] Add variable types

  ## Usage/Examples

```hcl
locals {
  # Deployment Details
  infra_deploy   = yamldecode(file("${path.module}/deploy_vcenter.yaml"))
  deploy_vcenter = local.infra_deploy.deploy_vcenter
}

module "deploy_vcenter" {
  source                = "github.com/kalenarndt/terraform-vsphere-vcsa"
  for_each              = local.deploy_vcenter
  esxi_hostname         = each.value.esxi_hostname
  esxi_username         = each.value.esxi_username
  esxi_password         = each.value.esxi_password
  vcsa_network          = each.value.vcsa_network
  vcsa_datastore        = each.value.vcsa_datastore
  disk_mode             = each.value.disk_mode
  deployment_size       = each.value.deployment_size
  vcenter_hostname      = each.value.vcenter_hostname
  ip_family             = each.value.ip_family
  network_mode          = each.value.network_mode
  vcenter_fqdn          = each.value.system_name
  vcenter_ip            = each.value.vcenter_ip
  vcenter_prefix        = each.value.vcenter_prefix
  vcenter_gateway       = each.value.vcenter_gateway
  vcenter_dns           = each.value.vcenter_dns
  vcenter_root_password = each.value.vcenter_root_password
  vcenter_ntp_server    = each.value.vcenter_ntp_server
  vcenter_ssh_enabled   = each.value.vcenter_ssh_enabled
  vcenter_sso_password  = each.value.vcenter_sso_password
  vcenter_sso_domain    = each.value.vcenter_sso_domain
  vcenter_ceip_status   = each.value.vcenter_ceip_status
  binaries_path         = each.value.binaries_path
}
```
Ensure that you modify the deploy_vcenter.yaml file to match the details of your environment. 

Place the deploy_vcenter.yaml file where your main.tf file is in your deployment or modify the usage example for the path to your yaml file.

```yaml
deploy_vcenter:
  vcsa01:
    esxi_hostname: esxi2.bmrf.io
    esxi_username: root
    esxi_password: yourhostpassword
    vcsa_network: Sector-B-VL21
    vcsa_datastore: ESXi2-SSD
    disk_mode: true
    deployment_size: small
    vcenter_hostname: vc-sb.bmrf.io
    ip_family: ipv4
    network_mode: static
    system_name: vc-sb.bmrf.io
    vcenter_ip: "172.16.21.10"
    vcenter_prefix: "24"
    vcenter_gateway: "172.16.21.1"
    vcenter_dns: "172.16.11.2"
    vcenter_root_password: yourpassword
    vcenter_ntp_server: time.bmrf.io
    vcenter_ssh_enabled: true
    vcenter_sso_password: yourpassword
    vcenter_sso_domain: vsphere.local
    vcenter_ceip_status: false
    binaries_path: /binaries/vcsa
```
## License

[MIT](https://choosealicense.com/licenses/mit/)

  

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_deploy_vcenter"></a> [deploy\_vcenter](#module\_deploy\_vcenter) | github.com/kalenarndt/terraform-vsphere-vcsa | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vcenter_fqdn"></a> [vcenter\_fqdn](#output\_vcenter\_fqdn) | vCenter FQDN |
| <a name="output_vcenter_ip"></a> [vcenter\_ip](#output\_vcenter\_ip) | vCenter IP address |
| <a name="output_vcenter_password"></a> [vcenter\_password](#output\_vcenter\_password) | SSO user password that was set during the vCenter provisioning |
| <a name="output_vcenter_root_password"></a> [vcenter\_root\_password](#output\_vcenter\_root\_password) | Password for the local root user |
| <a name="output_vcenter_root_user"></a> [vcenter\_root\_user](#output\_vcenter\_root\_user) | Username for the local root user |
| <a name="output_vcenter_user"></a> [vcenter\_user](#output\_vcenter\_user) | SSO user that was created during the vCenter provisioning |
<!-- END_TF_DOCS -->