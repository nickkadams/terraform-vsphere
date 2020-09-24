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

resource "vsphere_content_library" "library" {
  name            = var.content_library
  storage_backing = [data.vsphere_datastore.datastore.id]
  description     = "Managed by Terraform"
}

# Upload ISOs
resource "vsphere_content_library_item" "ubuntu18" {
  name        = "Ubuntu Bionic 18.04"
  description = "Ubuntu ISO"
  library_id  = vsphere_content_library.library.id
  file_url    = "http://cdimages.ubuntu.com/ubuntu/releases/bionic/release/ubuntu-18.04.5-server-amd64.iso"
  type        = "iso"
}

resource "vsphere_content_library_item" "ubuntu20" {
  name        = "Ubuntu Focal 20.04"
  description = "Ubuntu ISO"
  library_id  = vsphere_content_library.library.id
  file_url    = "http://cdimage.ubuntu.com/ubuntu-legacy-server/releases/20.04/release/ubuntu-20.04-legacy-server-amd64.iso"
  type        = "iso"
}

resource "vsphere_content_library_item" "centos8" {
  name        = "CentOS 8"
  description = "CentOS ISO"
  library_id  = vsphere_content_library.library.id
  file_url    = "http://repo1.ash.innoscale.net/centos/8/isos/x86_64/CentOS-8.2.2004-x86_64-minimal.iso"
  type        = "iso"
}

resource "vsphere_content_library_item" "rancher" {
  name        = "RancherOS 1.5"
  description = "RancherOS ISO"
  library_id  = vsphere_content_library.library.id
  file_url    = "https://releases.rancher.com/os/v1.5.6/vmware/rancheros.iso"
  type        = "iso"
}