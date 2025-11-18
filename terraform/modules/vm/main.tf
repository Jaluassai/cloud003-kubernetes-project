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
    }

    ip_config {
      ipv4 {
        address = "dhcp"
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