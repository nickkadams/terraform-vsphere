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

variable "vcsa_license" {
  description = "vCSA license key"
  type        = string
}

variable "vsphere_license" {
  description = "vSphere license key"
  type        = string
}

variable "vsphere_datacenter" {
  default     = "us-east-1"
  description = "vSphere datacenter name"
  type        = string
}

variable "tag_env" {
  default     = "production"
  description = "Tag: Environment"
  type        = string
}

variable "vsphere_folder" {
  default     = "templates"
  description = "vSphere folder name"
  type        = string
}

variable "vsphere_cluster" {
  default     = "a"
  description = "vSphere cluster name"
  type        = string
}

variable "vsphere_host1_name" {
  description = "vSphere host1 name"
  type        = string
}

variable "vsphere_host1_thumbprint" {
  description = "vSphere host1 thumbprint"
  type        = string
}