# instance the provider
provider "libvirt" {
  uri = "qemu:///system"
}

# We fetch the latest ubuntu release image from their mirrors
resource "libvirt_volume" "jeos" {
  name   = "jeos15"
  pool   = "default"
  source = "http://download.suse.de/install/SLE-15-JeOS-GM/SLES15-JeOS.x86_64-15.0-OpenStack-Cloud-GM.qcow2"
  format = "qcow2"
}

# Create the machine
resource "libvirt_domain" "domain" {
  name   = "jeos"
  memory = "512"
  vcpu   = 1

  network_interface {
    network_name = "default"
  }
   # IMPORTANT: this is a known bug on cloud images, since they expect a console
  # we need to pass it
  # https://bugs.launchpad.net/cloud-images/+bug/1573095
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = "${libvirt_volume.ubuntu-qcow2.id}"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
}
}
