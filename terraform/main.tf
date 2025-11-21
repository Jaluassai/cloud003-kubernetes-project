module "demeter" {
  source = "./environments/demeter"
  
  basic_account   = var.basic_account
  secret_password = var.secret_password
  ssh_public_keys = var.ssh_public_keys
}

module "hera" {
  source = "./environments/hera"
  
  basic_account   = var.basic_account
  secret_password = var.secret_password
  ssh_public_keys = var.ssh_public_keys
}