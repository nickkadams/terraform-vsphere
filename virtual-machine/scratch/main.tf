provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  count = var.instance_count

  name             = "${var.vm_name}-${format(count.index + 1)}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.num_cpus
  memory   = var.memory
  guest_id = var.guest_id

  scsi_type = var.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = var.adapter_type
  }

  disk {
    label            = "disk0"
    size             = var.disk0_size
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 0
  }

  hardware_version = var.hardware_version

  tags = [true, var.tag_env]
}
