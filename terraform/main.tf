module "demeter" {
  source = "./environments/demeter"
  
  basic_account   = var.basic_account
  secret_password = var.secret_password
}

module "hera" {
  source = "./environments/hera"
  
  basic_account   = var.basic_account
  secret_password = var.secret_password
}