locals {
  binaries_path = var.binaries_path
  vcsa_template = templatefile("${path.module}/vcsa-esxi.json.tmpl", {
    esxi_hostname         = var.esxi_hostname
    esxi_username         = var.esxi_username
    esxi_password         = var.esxi_password
    vcsa_network          = var.vcsa_network
    vcsa_datastore        = var.vcsa_datastore
    disk_mode             = var.disk_mode
    deployment_size       = var.deployment_size
    vcenter_hostname      = var.vcenter_hostname
    ip_family             = var.ip_family
    network_mode          = var.network_mode
    vcenter_fqdn          = var.vcenter_fqdn
    vcenter_ip            = var.vcenter_ip
    vcenter_prefix        = var.vcenter_prefix
    vcenter_gateway       = var.vcenter_gateway
    vcenter_dns           = var.vcenter_dns
    vcenter_root_password = var.vcenter_root_password
    vcenter_ntp_server    = var.vcenter_ntp_server
    vcenter_ssh_enabled   = var.vcenter_ssh_enabled
    vcenter_sso_password  = var.vcenter_sso_password
    vcenter_sso_domain    = var.vcenter_sso_domain
    vcenter_ceip_status   = var.vcenter_ceip_status
  })
}

resource "local_file" "vcsa_template_to_json" {
  filename = "${local.binaries_path}/vcsa-esxi.json"
  content  = local.vcsa_template
}

resource "null_resource" "vcsa_deploy" {
  provisioner "local-exec" {
    command = "${local.binaries_path}/vcsa-cli-installer/lin64/vcsa-deploy install --accept-eula --acknowledge-ceip --no-ssl-certificate-verification ${local.binaries_path}/vcsa-esxi.json"
  }
}
