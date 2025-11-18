variable "node_name" {
  type = string
}

variable "url" {
  description = "Cloud image URL to download"
  type        = string
  default     = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

variable "file_name" {
  description = "File name to save as"
  type        = string
  default     = "noble-server-cloudimg.qcow2"
}

variable "datastore_id" {
  description = "Where cloud image will be stored"
  type        = string
  default     = "local"
}
