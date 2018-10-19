# instance the provider
provider "libvirt" {
  uri = "qemu:///system"
}

# We fetch the latest ubuntu release image from their mirrors
resource "libvirt_volume" "jeos" {
  name   = "jeos15"
  pool   = "default"
  source = "http://download.suse.de/ibs/SUSE:/SLE-15-SP1:/Update:/CR/images/SLES15-SP1-JeOS.x86_64-15.1-OpenStack-Cloud-Build27.8.qcow2"
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

  disk {
    volume_id = "${libvirt_volume.jeos.id}"
  }

 
}
