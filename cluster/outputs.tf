output "datacenter" {
  description = "vSphere datacenter"
  value       = vsphere_datacenter.dc.id
}

output "folder" {
  description = "vSphere folder name"
  value       = var.vsphere_folder
}

# output "folder_id" {
#   description = "vSphere folder managed object ID"
#   value       = vsphere_folder.folder.id
# }

output "vcsa_license_edition" {
  description = "vCSA license key"
  value       = vsphere_license.vcsa.edition_key
}

output "vsphere_license_edition" {
  description = "vSphere license key"
  value       = vsphere_license.vsphere.edition_key
}

output "vsphere_license_cpu_count" {
  description = "vSphere license CPU count"
  value       = vsphere_license.vsphere.total
}

output "cluster" {
  description = "vSphere compute cluster name"
  value       = var.vsphere_cluster
}

# output "cluster_resource_pool_id" {
#   description = "vSphere compute cluster managed object ID"
#   value       = vsphere_compute_cluster.cc.id
# }

output "vsphere_host1" {
  description = "vSphere host 1"
  value       = var.vsphere_host1_name
}

# output "vsphere_host1_id" {
#   description = "vSphere host 1 managed object ID"
#   value       = vsphere_host.h1.id
# }