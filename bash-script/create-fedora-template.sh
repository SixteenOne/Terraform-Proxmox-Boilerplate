#! /bin/bash
echo Downloading Image
wget -q https://download.fedoraproject.org/pub/fedora/linux/releases/36/Cloud/x86_64/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2
echo Creating VM
qm create 9999 --name fedora-cloud-init --memory 2048 --core 2 --net0 virtio,bridge=vmbr0
echo Importing disk
qm importdisk 9999 Fedora-Cloud-Base-36-1.5.x86_64.qcow2 storage-name
echo Adding additional setting
qm set 9999 --scsihw virtio-scsi-pci --scsi0 storage-name:vm-9999-disk-0
qm set 9999 --ide2 storage-name:cloudinit --boot c --bootdisk scsi0 --serial0 socket --vga serial0
qm resize 9999 scsi0 +4G
qm set 9999 --agent enabled=1,fstrim_cloned_disks=1
qm set 9999 --sshkey id_ed25519.pub
qm cloudinit dump 9999 user
echo Converting to a Template
qm template 9999
rm Fedora-Cloud-Base-36-1.5.x86_64.qcow2