module "cloud_image" {
  source    = "../../modules/cloud_image"
}
# Master nodes
module "vms" {
  source = "../../modules/vm"

  environment     = "demeter"
  vm_count        = 3
  name_prefix     = "master"
  node_name       = "Hades01"
  starting_vm_id  = 3000

  cloud_image_id  = module.cloud_image.image_id
  disk_size       = 20
  cpu_cores       = 4
  memory          = 2048
  network_bridge  = "vmbr0"
  ip_addresses    = ["192.168.100.131/24", "192.168.100.132/24", "192.168.100.133/24"]
  gw              = "192.168.100.1"

  basic_account   = var.basic_account
  secret_password = var.secret_password
  ssh_public_keys = var.ssh_public_keys
}

# Worker nodes
module "worker_vms" {
  source = "../../modules/vm"

  environment     = "demeter"
  vm_count        = 3
  name_prefix     = "worker"
  node_name       = "Hades01"
  starting_vm_id  = 3050

  cloud_image_id  = module.cloud_image.image_id
  disk_size       = 20
  cpu_cores       = 2
  memory          = 2048
  network_bridge  = "vmbr0"
  ip_addresses    = ["192.168.100.135/24", "192.168.100.136/24", "192.168.100.137/24"]
  gw              = "192.168.100.1"

  basic_account   = var.basic_account
  secret_password = var.secret_password
  ssh_public_keys = var.ssh_public_keys
}
