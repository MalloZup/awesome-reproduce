# awesome-reproduce
reproducing something with terraform

# Install terraform and terraform-provider-libvirt:

1) Downlad latest terraform https://www.terraform.io/downloads.html and put it on `/usr/bin/`

2) Install the plugin-libvirt with https://software.opensuse.org/download/package?project=systemsmanagement:terraform&package=terraform-provider-libvirt  ( you can use the zypper pkg)


# Reproduction:

Clone this repository.

```bash
cd example-bad
terraform init
terraform apply
``` 
You can compare with good-example

# INFO

```bash
./terraform-provider-libvirt -version
./terraform-provider-libvirt was not built correctly
Compiled against library: libvirt 4.4.0
Using library: libvirt 4.4.0
Running hypervisor: QEMU 3.0.0
Running against daemon: 4.4.0
```
