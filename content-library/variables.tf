variable "vsphere_user" {
  default     = "administrator@vsphere.local"
  description = "vSphere user"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
}

variable "vsphere_server" {
  description = "vSphere server"
  type        = string
}

variable "vsphere_datacenter" {
  default     = "us-east-1"
  description = "vSphere datacenter name"
  type        = string
}

variable "datastore" {
  description = "vSphere datastore"
  type        = string
}

variable "content_library" {
  default     = "library"
  description = "vSphere content library"
  type        = string
}