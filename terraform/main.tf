resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  count = 3
  name      = "test-ubuntu-${count.index + 1}"
  node_name = "Hades01"

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
    import_from  = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  cpu {
    type = "host"
    cores = 2
    numa = true
  }

  memory {
    dedicated = 1024
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "import"
  datastore_id = "local"
  node_name = "Hades01"
  overwrite_unmanaged = true
  url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  file_name = "noble-server-cloudimg-amd64.img.qcow2"
}