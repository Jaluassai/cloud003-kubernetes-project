module "vms" {
  source = "../../modules/vm"
  
  environment   = "prod"
  vm_count      = 3
  name_prefix   = "ubuntu"
  node_name     = "Hades01"
  starting_vm_id = 3000
  
  cloud_image_id = proxmox_virtual_environment_download_file.ubuntu_image.id
  disk_size     = 40
  cpu_cores     = 4
  memory        = 4096
  network_bridge = "vmbr0"
}

resource "proxmox_virtual_environment_download_file" "ubuntu_image" {
  content_type        = "import"
  datastore_id        = "local"
  node_name           = "Hades01"
  overwrite_unmanaged = true
  url                 = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  file_name           = "noble-server-cloudimg-amd64.img.qcow2"
}