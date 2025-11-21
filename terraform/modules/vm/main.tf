resource "proxmox_virtual_environment_vm" "vm" {
  count      = var.vm_count
  name       = "${var.environment}-${var.name_prefix}-${count.index + 1}"
  node_name  = var.node_name
  vm_id      = var.starting_vm_id + count.index
  on_boot    = true
  started    = true

  stop_on_destroy = true

  initialization {
    user_account {
      username = var.basic_account
      password = var.secret_password
      keys     = values(var.ssh_public_keys)
    }

    ip_config {
      ipv4 {
        #address = var.ip_address
        address = length(var.ip_addresses) > 0 ? var.ip_addresses[count.index] : "dhcp"
        #gateway = length(var.ip_addresses) > 0 && var.gateway != null ? var.gateway : null
        gateway = var.gw
      }
    }
  }

  disk {
    datastore_id = "local-lvm"
    import_from  = var.cloud_image_id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  cpu {
    type  = "host"
    cores = var.cpu_cores
    numa  = true
  }

  memory {
    dedicated = var.memory
  }

  network_device {
    bridge = var.network_bridge
  }

  operating_system {
    type = "l26"
  }

  tags = [var.environment]
}