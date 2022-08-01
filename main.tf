resource "proxmox_vm_qemu" "DB-Cloud-Creation" {
    name = "${var.servername}${count.index + 1}"
    desc = "Enter-a-description-here"
    vmid = "20${count.index + 1}"
    #nameserver = "192.168.68.250"  # Use to change your DNS Server
    count = var.vm_count
    
   	target_node = element(var.proxmox_hosts, count.index)

    # The destination resource pool for the new VM
    #pool = "pool0"

    # The template name to clone this vm from
    clone = "clone-name" # Replace with the name of your Clone Template Name
    full_clone = true
    onboot = true

    # Activate QEMU agent for this VM
    # agent = 1

    os_type = "cloud-init"
    cores = 2
    sockets = 1
    vcpus = 0
    cpu = "host"
    memory = 2048
    # scsihw = "virtio-scsi-pci"

    # Setup the disk
    # disk {
    #   size = "6492M"
    #   type = "scsi"
    #   storage = "NFS"
    #   storage_type = "rbd"
    #   iothread = 1
    #   ssd = 1
    #   discard = "on"
    # }

    # Setup the network interface and assign a vlan tag: 256
    # network {
    #     model = "virtio"
    #     bridge = "vmbr0"
    # }

    # Setup the ip address using cloud-init.
    # Keep in mind to use the CIDR notation for the ip.
    ipconfig0 = "ip=192.168.68.1${count.index + 1}/24,gw=192.168.68.1"

    sshkeys = <<EOF
    ${var.ssh_key}
    EOF

    timeouts {
      create = "10m"
      read = "10m"
      update = "10m"
    }
}