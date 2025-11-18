resource "proxmox_virtual_environment_download_file" "image" {
  content_type        = "import"
  datastore_id        = var.datastore_id
  node_name           = var.node_name
  overwrite_unmanaged = true
  url                 = var.url
  file_name           = var.file_name
}
