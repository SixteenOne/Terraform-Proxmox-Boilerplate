#! /bin/bash
echo Downloading Image
wget -q https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2
echo Creating VM
qm create 9998 --name db-cloud-local --memory 2048 --core 2 --net0 virtio,bridge=vmbr0
echo Importing disk
qm importdisk 9998 debian-11-generic-amd64.qcow2 storage-name
echo Adding additional setting
qm set 9998 --scsihw virtio-scsi-pci --scsi0 storage-name:vm-9998-disk-0
qm set 9998 --ide2 storage-name:cloudinit --boot c --bootdisk scsi0 --serial0 socket --vga serial0
qm resize 9998 scsi0 +2G
qm set 9998 --agent enabled=1,fstrim_cloned_disks=1
qm set 9998 --sshkey id_ed25519.pub
qm cloudinit dump 9998 user
echo Converting to a Template
qm template 9998
rm debian-11-generic-amd64.qcow2