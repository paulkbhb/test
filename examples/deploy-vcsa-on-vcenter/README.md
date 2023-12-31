
# Terraform vSphere VCSA 

This Terraform module creates and deploys a vCenter Server Appliance on an ESXi host or in a vCenter environment. 


## Acknowledgements

 - [Based on a module by Riverpoint Technology](https://github.com/rptcloud/terraform-vsphere-vcsa)


  ## Usage/Examples

```hcl
module "deploy_vcenter" {
  source                = "kalenarndt/vcsa-deploy/vsphere"

  deploy_type           = "vc"
  vc_datacenter         = "Black Mesa"
  vc_username           = "administrator@vsphere.local"
  vc_hostname           = "vc.bmrf.io"
  vc_password           = "VMware123!"
  vc_cluster            = "Compute"
  vcsa_network          = "Sector-B-VL21"
  vcsa_datastore        = "ESXi2-SSD"
  deployment_size       = "small"
  vcenter_hostname      = "vc-sb.bmrf.io"
  vcenter_fqdn          = "vc-sb.bmrf.io"
  vcenter_ip            = "172.16.21.10"
  vcenter_prefix        = "24"
  vcenter_gateway       = "172.16.21.1"
  vcenter_dns           = "172.16.11.2"
  vcenter_root_password = "VMware123!"
  vcenter_ntp_server    = "time.bmrf.io"
  binaries_path         = "/binaries/vcsa"
}
```
Ensure that you modify the block to what you want and override defaults where required.


```bash
terraform init
ferraform plan
terraform apply
```
## Notes:

binaries_path is where you have the contents of your vcsa iso extracted to. This should be local to where Terraform is executed or a mapped mount / drive

## License

[MIT](https://choosealicense.com/licenses/mit/)

  

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | >=1.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.vcsa_template_to_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.vcsa_linux_deploy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.vcsa_windows_deploy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_binaries_path"></a> [binaries\_path](#input\_binaries\_path) | Path for the vCenter server deployment binaries | `string` | n/a | yes |
| <a name="input_deploy_type"></a> [deploy\_type](#input\_deploy\_type) | Type of deployment that will be performed - esxi or vc | `string` | `"esxi"` | no |
| <a name="input_deployment_size"></a> [deployment\_size](#input\_deployment\_size) | vCenter server deployment size | `string` | `"tiny"` | no |
| <a name="input_disk_mode"></a> [disk\_mode](#input\_disk\_mode) | Thin provisioned disk mode | `bool` | `true` | no |
| <a name="input_esxi_hostname"></a> [esxi\_hostname](#input\_esxi\_hostname) | ESXi hostname of the target host | `string` | `""` | no |
| <a name="input_esxi_password"></a> [esxi\_password](#input\_esxi\_password) | Password for the account on the target host | `string` | `""` | no |
| <a name="input_esxi_username"></a> [esxi\_username](#input\_esxi\_username) | Username for the account on the target ESXi host | `string` | `""` | no |
| <a name="input_ip_family"></a> [ip\_family](#input\_ip\_family) | Setting for ipv4 or ipv6 | `string` | `"ipv4"` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | Static or DHCP configuration for the network mode | `string` | `"static"` | no |
| <a name="input_vc_cluster"></a> [vc\_cluster](#input\_vc\_cluster) | Cluster where the appliance will be deployed | `string` | `""` | no |
| <a name="input_vc_datacenter"></a> [vc\_datacenter](#input\_vc\_datacenter) | Datacenter where the appliance will be deployed | `string` | `""` | no |
| <a name="input_vc_hostname"></a> [vc\_hostname](#input\_vc\_hostname) | vCenter hostname of the target vCenter where the appliance will be deployed in | `string` | `""` | no |
| <a name="input_vc_password"></a> [vc\_password](#input\_vc\_password) | Password for the account on the target vCenter that will be used to deploy the appliance | `string` | `""` | no |
| <a name="input_vc_username"></a> [vc\_username](#input\_vc\_username) | Username for the account on the target vCenter that will be used to deploy the appliance | `string` | `""` | no |
| <a name="input_vcenter_ceip_status"></a> [vcenter\_ceip\_status](#input\_vcenter\_ceip\_status) | vCenter server CEIP status | `bool` | `false` | no |
| <a name="input_vcenter_dns"></a> [vcenter\_dns](#input\_vcenter\_dns) | vCenter server upstream DNS servers | `string` | n/a | yes |
| <a name="input_vcenter_fqdn"></a> [vcenter\_fqdn](#input\_vcenter\_fqdn) | vCenter server FQDN | `string` | n/a | yes |
| <a name="input_vcenter_gateway"></a> [vcenter\_gateway](#input\_vcenter\_gateway) | Default gateway for vCenter server | `string` | n/a | yes |
| <a name="input_vcenter_hostname"></a> [vcenter\_hostname](#input\_vcenter\_hostname) | Hostname for the vCenter Server Applaince | `string` | n/a | yes |
| <a name="input_vcenter_ip"></a> [vcenter\_ip](#input\_vcenter\_ip) | vCenter server IP Address | `string` | n/a | yes |
| <a name="input_vcenter_ntp_server"></a> [vcenter\_ntp\_server](#input\_vcenter\_ntp\_server) | vCenter server NTP server | `string` | `"pool.ntp.org"` | no |
| <a name="input_vcenter_prefix"></a> [vcenter\_prefix](#input\_vcenter\_prefix) | vCenter server subnet prefix | `string` | `"24"` | no |
| <a name="input_vcenter_root_password"></a> [vcenter\_root\_password](#input\_vcenter\_root\_password) | vCenter server root password | `string` | n/a | yes |
| <a name="input_vcenter_ssh_enabled"></a> [vcenter\_ssh\_enabled](#input\_vcenter\_ssh\_enabled) | vCenter SSH setting | `bool` | `true` | no |
| <a name="input_vcenter_sso_domain"></a> [vcenter\_sso\_domain](#input\_vcenter\_sso\_domain) | vCenter server SSO domain | `string` | `"vsphere.local"` | no |
| <a name="input_vcenter_sso_password"></a> [vcenter\_sso\_password](#input\_vcenter\_sso\_password) | vCenter server SSO password | `string` | `"VMware123!"` | no |
| <a name="input_vcsa_datastore"></a> [vcsa\_datastore](#input\_vcsa\_datastore) | Target datastore for the vCenter appliance | `string` | n/a | yes |
| <a name="input_vcsa_network"></a> [vcsa\_network](#input\_vcsa\_network) | Target vCenter appliance network | `string` | n/a | yes |
| <a name="input_windows"></a> [windows](#input\_windows) | Toggle for executing the windows binary for deploying the vcsa | `bool` | `false` | no |

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
