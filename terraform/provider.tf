terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.86.0"
    }
  }
}

variable proxmox_api_url {
    type = string
}

variable proxmox_api_token_id {
    type = string
}

variable proxmox_api_token_secret {
    type = string
}

variable PROXMOX_VE_USERNAME {
    type = string
}

variable PROXMOX_VE_PASSWORD {
    type = string
}

provider "proxmox" {
  endpoint = var.proxmox_api_url
  api_token = var.proxmox_api_token_id

  ssh {
    agent = true
    username = var.PROXMOX_VE_USERNAME
    password = var.PROXMOX_VE_PASSWORD
  }

}