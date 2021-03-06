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

data "vsphere_datastore" "ds" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.compute_cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name = var.virtual_machine_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.virtual_machine_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.ds.id
  num_cpus         = 1
  memory           = 1024
  guest_id = data.vsphere_virtual_machine.template.guest_id
  folder = var.virtual_machine_folder
  wait_for_guest_ip_timeout = -1
  wait_for_guest_net_timeout = -1
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

 clone {
   template_uuid = data.vsphere_virtual_machine.template.id
   customize {
      linux_options {
        host_name = "hello-world"
        domain    = "example.com"
      }
      network_interface {
        ipv4_address = "172.16.0.10"
        ipv4_netmask = 24
      }
      ipv4_gateway = "10.0.0.1"
    }
  }
}
