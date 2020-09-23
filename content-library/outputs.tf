output "content_library" {
  description = "vSphere content library name"
  value       = var.content_library
}

output "content_library_datastore" {
  description = "vSphere content library on datastore"
  value       = var.datastore
}

output "content_library_id" {
  description = "vSphere content library managed object ID"
  value       = vsphere_content_library.library.id
}