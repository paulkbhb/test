output "vcenter_ip" {
  value       = module.deploy_vcenter.vcenter_ip
  description = "vCenter IP address"
}

output "vcenter_fqdn" {
  value       = module.deploy_vcenter.vcenter_fqdn
  description = "vCenter FQDN"
}

output "vcenter_user" {
  value       = module.deploy_vcenter.vcenter_user
  description = "SSO user that was created during the vCenter provisioning"
}

output "vcenter_password" {
  value       = module.deploy_vcenter.vcenter_password
  description = "SSO user password that was set during the vCenter provisioning"
}

output "vcenter_root_user" {
  value       = "root"
  description = "Username for the local root user"
}

output "vcenter_root_password" {
  value       = module.deploy_vcenter.vcenter_root_password
  description = "Password for the local root user"
}
