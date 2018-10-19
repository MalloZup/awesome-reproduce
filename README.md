# awesome-reproduce
reproducing something with terraform

# Install terraform and terraform-provider-libvirt:

1) Downlad latest terraform https://www.terraform.io/downloads.html and put it on `/usr/bin/`

2) Install the plugin-libvirt with https://software.opensuse.org/download/package?project=systemsmanagement:terraform&package=terraform-provider-libvirt  ( you can use the zypper pkg)


# Reproduction:

Clone this repository.

```bash
cd example
terraform init
terraform apply
``` 
