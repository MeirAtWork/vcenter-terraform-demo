provider "vsphere" {
  user           = var.private_cloud_login
  password       = var.private_cloud_password
  vsphere_server = var.private_cloud_host
  version        = "=2.1.1"
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}

data "vsphere_host" "host" {
  name          = var.esxi_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

# data "vsphere_distributed_virtual_switch" "vds" {
#   name          = "myDistSwitch"
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

# resource "vsphere_distributed_port_group" "pg" {
#   name                            = "terraform-test-pg"
#   distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.vds.id

#   active_uplinks  = ["${data.vsphere_distributed_virtual_switch.vds.uplinks[0]}"]
#   standby_uplinks = ["${data.vsphere_distributed_virtual_switch.vds.uplinks[1]}"]
# }

#---------------------------------

# data "vsphere_network" "net" {
#   name          = "Anetwork"//"vSwitch5", "vmnic0"
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

resource "vsphere_host_port_group" "pg" {
  name                = var.port_group_name
  host_system_id      = data.vsphere_host.host.id
  virtual_switch_name = var.virtual_switch_name
  vlan_id             = var.vlan_id // this is a vlan that IT had configured a DHCP for it
  #allow_promiscuous = true
}

#------------------------

# resource "vsphere_host_virtual_switch" "switch" {
#   name           = "vSwitchTerraformTest"
#   host_system_id = "${data.vsphere_host.host.id}"

#   network_adapters = ["vmnic0", "vmnic1"]

#   active_nics  = ["vmnic1"]
#   standby_nics = ["vmnic0"]
# }

# resource "vsphere_host_port_group" "pg" {
#   name                = "PGTerraformTest"
#   host_system_id      = "${data.vsphere_host.host.id}"
#   virtual_switch_name = "${vsphere_host_virtual_switch.switch.name}"
#   vlan_id = 4095
#   allow_promiscuous = true
# }

#---------------------------------

# resource "vsphere_distributed_virtual_switch" "vds" {
#   name          = var.virtual_switch_name
#   datacenter_id = data.vsphere_datacenter.dc.id

#   uplinks         = ["uplink1", "uplink2", "uplink3", "uplink4"]
#   active_uplinks  = ["uplink1", "uplink2"]
#   standby_uplinks = ["uplink3", "uplink4"]

#   host {
#     host_system_id = data.vsphere_host.host.id
#     devices        = [var.network_interface]
#   }
# }

# resource "vsphere_distributed_port_group" "pg" {
#   name                            = var.port_group_name
#   distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.vds.id

#   vlan_range {
#     min_vlan = 100
#     max_vlan = 199
#   }
# }
