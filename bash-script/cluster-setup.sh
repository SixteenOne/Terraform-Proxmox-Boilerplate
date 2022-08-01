#! /bin/bash
## Setup Cluster info using sed. Change all of the --REPLACE-ME-- text to fit your need.
# Also amend lines 8 & 9 for VMID and IP Address

# main.tf
sed -i 's/Enter-a-description-here/--REPLACE-ME--/' ../main.tf                      # Description in Proxmox for VM's
sed -i 's/clone-name/--REPLACE-ME--/' ../main.tf                                    #Name of Clone that you created
sed -i 's/vmid = "20/vmid = "21/' ../main.tf                                        # Starting VMID
sed -i 's|ipconfig0 = "ip=192.168.68.1|ipconfig0 = "ip=192.168.68.3|' ../main.tf    # Starting IP Address

# variables
sed -i 's|https://proxmox-server01.example.com:8006/api2/json|https://--REPLACE-ME--:8006/api2/json|' ../variables.tf     # Proxmox URL
sed -i 's|default = "password"|default = "--REPLACE-ME--"|' ../variables.tf                                               # Password of API User
sed -i 's|enter-ssh-detail-here|--REPLACE-ME--|'  ../variables.tf                                                         # Full SSH text
sed -i 's/enter-name-of-servers/--REPLACE-ME--/'  ../variables.tf                                                         # Name of VM's in Proxmox
sed -i 's|"if-you-have-a-cluster","Comma-Seperate-them","Here-in-quotes"|--REPLACE-ME--|'  ../variables.tf                # List of Proxmox Cluster Server Names
