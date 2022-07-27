# Use guide - https://registry.terraform.io/providers/Telmate/proxmox/latest/docs - to setup user/permissions

variable "pm_api_url" {
  default = "https://proxmox-server01.example.com:8006/api2/json"
}

variable "pm_user" {
  default = "terraform-prov@pve"
}

variable "pm_password" {
  default = "password"
}

variable "ssh_key" {
  default = "enter ssh detail here"
}

variable "servername" {
  default = "enter name of servers"
}

variable "vm_count" {
  description = "Number of VM's required"
  default = 3
}

variable "proxmox_hosts" {
  default = ["if you have a cluster","Comma Seperate them","Here in quotes"]
}