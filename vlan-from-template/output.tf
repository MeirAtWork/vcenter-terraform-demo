

# output "vsphere_network_id" {
#   value = data.vsphere_network.net.id
# }

# output "vsphere_host_virtual_switch_id" {
#   value = vsphere_host_virtual_switch.switch.id
# }

output "vsphere_host_port_group_id" {
  value = vsphere_host_port_group.pg.id
}

output "vsphere_host_port_group_key" {
  value = vsphere_host_port_group.pg.key
}

output "vsphere_host_port_group_computed_policy" {
  value = vsphere_host_port_group.pg.computed_policy
}

output "vsphere_host_port_group_ports" {
  value = vsphere_host_port_group.pg.ports
}

#-------------

# output "vsphere_distributed_virtual_switch_id" {
#   value = data.vsphere_distributed_virtual_switch.vds.id
# }

# output "vsphere_distributed_virtual_switch_id" {
#   value = vsphere_distributed_virtual_switch.vds.id
# }

# output "vsphere_distributed_port_group_id" {
#   value = vsphere_distributed_port_group.pg.id
# }

# output "vsphere_distributed_port_group_key" {
#   value = vsphere_distributed_port_group.pg.key
# }

# output "vsphere_distributed_port_group_config_version" {
#   value = vsphere_distributed_port_group.pg.config_version
# }
