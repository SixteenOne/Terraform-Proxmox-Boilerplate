# Description

Simple bash script to run on Proxmox servers to create Cloud Init Templates

## Choose your Distro

I have included Debian and Fedora. You can choose another Distro if you want and adjust the script accordingly

## How to run

Change `storage-name` to the Storage Name on your Proxmox Server(s)

Make sure that passwordless `ssh` is working and then run the file against the server

```sh
ssh proxmox1 > create-debian-template.sh
```

This will take the file and run it against the server. Make sure that Cloud-init is successfull by checking on the Proxmox GUI

## Clusters

If you have a 3 Node Proxmox Cluster and you run the Terraform on it, it can only create a Clone from a Server that has the Template on it. It will them move the newly created clone onto one of the other servers

For efficiency, run the script on all of your Servers, but you need to change the VMID for each Server, as this must be unique

Terraform is only looking for the Template Name, it doesn't care for the VMID