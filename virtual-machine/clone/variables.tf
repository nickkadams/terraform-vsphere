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

variable "vsphere_cluster" {
  default     = "a"
  description = "vSphere cluster name"
  type        = string
}

variable "vsphere_network" {
  default     = "VM Network"
  description = "vSphere network name"
  type        = string
}

variable "template_name" {
  description = "Virtual machine template name"
  type        = string
}

variable "instance_count" {
  default     = 1
  description = "Virtual machine instance_count"
  type        = number
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "num_cpus" {
  default     = 2
  description = "Virtual machine number of vCPUs"
  type        = number
}

variable "memory" {
  default     = 2048
  description = "Virtual machine memory in MB"
  type        = number
}

# variable "adapter_type" {
#   default     = "vmxnet3"
#   description = "Virtual machine adapter type (e1000, e1000e, or vmxnet3)"
#   type        = string
# }

variable "disk1_size" {
  default     = 10
  description = "Virtual machine disk1 size in GB"
  type        = number
}

variable "hardware_version" {
  default     = 15
  description = "Virtual machine hardware version number (4-15)"
  type        = number

  validation {
    condition     = var.hardware_version >= 4 && var.hardware_version <= 15
    error_message = "The hardware_version value must be between 4 and 15."
  }
}

variable "domain" {
  description = "Virtual machine domain"
  type        = string
}

variable "time_zone" {
  default     = "UTC"
  description = "Virtual machine time zone"
  type        = string
}

variable "tag_env" {
  default     = "production"
  description = "Tag: Environment"
  type        = string
}

