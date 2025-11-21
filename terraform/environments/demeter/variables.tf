variable "basic_account" {
  type = string
}

variable "secret_password" {
  type = string
}

variable "ssh_public_keys" {
  description = "Map of SSH public keys"
  type        = map(string)
  default     = {}
}