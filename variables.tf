variable "esxi_hostname" {
  description = "ESXi hostname of the target host"
}

variable "esxi_username" {
  description = "Username for the account on the target ESXi host"
  default     = "root"
}

variable "esxi_password" {
  description = "Password for the account on the target host"
}

variable "vcsa_network" {
  description = "Target vCenter appliance network"
}

variable "vcsa_datastore" {
  description = "Target datastore for the vCenter appliance"
}

variable "disk_mode" {
  default     = true
  description = "Thin provisioned disk mode"
}

variable "deployment_size" {
  default     = "small"
  description = "vCenter server deployment size"
}

variable "vcenter_prefix" {
 description = "vCenter server subnet prefix"
 default = "24"
}

variable "vcenter_hostname" {
  description = "Hostname for the vCenter Server Applaince"
}

variable "ip_family" {
  default     = "ipv4"
  description = "Setting for ipv4 or ipv6"
}

variable "network_mode" {
  default     = "static"
  description = "Static or DHCP configuration for the network mode"
}

variable "vcenter_ip" {
 description = "vCenter server IP Address"
}

variable "vcenter_gateway" {
 description = "Default gateway for vCenter server"
}

variable "vcenter_dns" {
  description = "vCenter Server upstream DNS servers"

}

variable "vcenter_root_password" {
 description = "vCenter server root password"
}

variable "vcenter_ntp_server" {
 description = "vCenter server NTP server"
}

variable "vcenter_ssh_enabled" {
 description = "vCenter SSH setting"
}

variable "vcenter_sso_password" {
  description = "vCenter server SSO password"
  default = "VMware123!"
}

variable "vcenter_sso_domain" {
 description = "vCenter server SSO domain"
 default = "vsphere.local"
}

variable "vcenter_ceip_status" {
 description = "vCenter server CEIP status"
}

variable "vcenter_fqdn" {
 description = "vCenter server FQDN"
}

variable "binaries_path" {
 description = "Path for the vCenter server deployment binaries"
}
