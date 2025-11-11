variable proxmox_api_url {
    description = "api url"
    type = string
    sensitive = false
}

variable proxmox_api_token_id {
    description = "api token id"
    type = string
    sensitive = true
}

variable proxmox_api_token_secret {
    description = "api token secret"
    type = string
    sensitive = true
}

variable PROXMOX_VE_USERNAME {
    description = "username for terraform account"
    type = string
    sensitive = true
}

variable PROXMOX_VE_PASSWORD {
    description = "passwd for terraform account"
    type = string
    sensitive = true
}