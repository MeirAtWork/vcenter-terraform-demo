variable "private_cloud_login" {
  type = string
  sensitive = true
}

variable "private_cloud_password" {
  type = string
  sensitive = true
}

variable "private_cloud_host" {
  type = string
  sensitive = true
}

variable "datacenter_name" {
  type = string
  default = "Sandbox vCenter"
}

variable "esxi_host" {
  type = string
  default = ""
}

# variable "network_interface" {
#   type = string
#   default = "vmnic1"
# }

variable "virtual_switch_name" {
  type = string
  default = ""
}

variable "port_group_name" {
  type = string
  default = ""
}

variable "vlan_id" {
  type = number
  default = 0
}

# variable "uplink_name" {
#   type = string
#   default = ""
# }