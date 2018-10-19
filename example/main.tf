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
}
