provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource "vsphere_license" "vcsa" {
  license_key = var.vcsa_license
}

resource "vsphere_license" "vsphere" {
  license_key = var.vsphere_license
}

resource "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter

  tags = [vsphere_tag.true.id, vsphere_tag.environment.id]
}

# Tags
resource "vsphere_tag_category" "terraform" {
  name        = "Terraform"
  cardinality = "SINGLE"
  description = "Managed by Terraform"

  associable_types = [
    "ClusterComputeResource",
    "Datacenter",
    "Datastore",
    "StoragePod",
    "VirtualMachine"
  ]
}

resource "vsphere_tag" "true" {
  name        = "true"
  category_id = vsphere_tag_category.terraform.id
  description = "Managed by Terraform"
}

resource "vsphere_tag_category" "environment" {
  name        = "Environment"
  cardinality = "SINGLE"
  description = "Managed by Terraform"

  associable_types = [
    "ClusterComputeResource",
    "Datacenter",
    "Datastore",
    "StoragePod",
    "VirtualMachine"
  ]
}

resource "vsphere_tag" "environment" {
  name        = var.tag_env
  category_id = vsphere_tag_category.environment.id
  description = "Managed by Terraform"
}

# Folder
resource "vsphere_folder" "folder" {
  path          = var.vsphere_folder
  type          = "vm"
  datacenter_id = vsphere_datacenter.dc.moid
}

# Cluster
resource "vsphere_compute_cluster" "cc" {
  name          = var.vsphere_cluster
  datacenter_id = vsphere_datacenter.dc.moid
  host_managed  = true

  drs_enabled          = false
  drs_automation_level = "fullyAutomated"

  ha_enabled = false

  vsan_enabled = false

  tags = [vsphere_tag.true.id, vsphere_tag.environment.id]
}

# Hosts
resource "vsphere_host" "h1" {
  hostname   = var.vsphere_host1_name
  username   = "root"
  password   = var.vsphere_password
  cluster    = vsphere_compute_cluster.cc.id
  thumbprint = var.vsphere_host1_thumbprint
  license    = var.vsphere_license
}