This repo aims to help quiclstart RancherOS usage on OpenStack. 
There is no official OpenStack released, so you have to build it and import into glance.

[Packer](http://packer.io) is used with the qemu builder to create the image which can be imported to glance.
But instead of describint how to install packer and quemu, the image build itself happens inside a Docker container.

## Build

```
make packer
```

## Import
Packer will create a qcow2 type image in `output_rancher` dir. You can import it into glance:

```
  glance image-create --name RancherOS \
  --container-format bare \
  --disk-format qcow2 \
  --file output_rancher/rancheros \
  --is-public True
```

## Upgrade ISO checksum

The packer file refers to the `latest` RancherOS iso. It means if a new version is released, you have to update
the `iso_checksum`. There is a make target to do calculate/update:

```
make md5-iso
```
