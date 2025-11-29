module "cloud_image" {
  source    = "../../modules/cloud_image"
}
# MASTER NODES
module "vms" {
  source = "../../modules/vm"

  environment     = "hera"
  vm_count        = 3
  name_prefix     = "master"
  node_name       = "Hades01"
  starting_vm_id  = 3100

  cloud_image_id  = module.cloud_image.image_id
  disk_size       = 20
  cpu_cores       = 4
  memory          = 2048
  network_bridge  = "vmbr0"
  ip_addresses    = [ "192.168.100.141/24", "192.168.100.142/24","192.168.100.143/24" ]
  gw              = "192.168.100.1"
  basic_account   = var.basic_account
  secret_password = var.secret_password
  ssh_public_keys = var.ssh_public_keys
}
# WORKER NODES
module "worker_vms" {
  source = "../../modules/vm"
  depends_on = [module.vms]

  environment     = "hera"
  vm_count        = 3
  name_prefix     = "worker"
  node_name       = "Hades01"
  starting_vm_id  = 3150

  cloud_image_id  = module.cloud_image.image_id
  disk_size       = 20
  cpu_cores       = 2
  memory          = 2048
  network_bridge  = "vmbr0"
  ip_addresses    = [ "192.168.100.145/24", "192.168.100.146/24","192.168.100.147/24" ]
  gw              = "192.168.100.1"

  basic_account   = var.basic_account
  secret_password = var.secret_password
  ssh_public_keys = var.ssh_public_keys
}
