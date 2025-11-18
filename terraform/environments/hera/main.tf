module "cloud_image" {
  source    = "../../modules/cloud_image"
  node_name = "Hades01"
}

module "vms" {
  source = "../../modules/vm"

  environment     = "hera"
  vm_count        = 3
  name_prefix     = "ubuntu"
  node_name       = "Hades01"
  starting_vm_id  = 3000

  cloud_image_id  = module.cloud_image.image_id
  disk_size       = 40
  cpu_cores       = 4
  memory          = 4096
  network_bridge  = "vmbr0"

  basic_account   = var.basic_account
  secret_password = var.secret_password
}
