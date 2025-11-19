variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
}

variable "name_prefix" {
  description = "Prefix for VM names"
  type        = string
}

variable "node_name" {
  description = "Proxmox node name"
  type        = string
}

variable "starting_vm_id" {
  description = "Starting VM ID"
  type        = number
  default     = 1000
}

# variable "ip_address" {
#   description = "IP address"
#   type = string
#   default = "dhcp"
# }

variable "ip_addresses" {
  description = "List of IP addresses for VMs"
  type        = list(string)
  default     = []  # Default Empty = DHCP
}

variable "gateway" {
  description = "Gateway for static IP configuration"
  type        = string
  default     = null
}

variable "gw" {
  default = null
  type = string
  description = "GW Config"
  
}
variable "basic_account" {
  type = string
}

variable "secret_password" {
  type = string
}

variable "cloud_image_id" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "cpu_cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "network_bridge" {
  type = string
}
