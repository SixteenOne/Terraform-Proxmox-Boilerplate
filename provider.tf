terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.10"
    }
  }
}

provider "proxmox" {
  pm_parallel       = 3
  # pm_tls_insecure   = true  # If you dont have valid Certificates, remove the hash
  pm_api_url        = var.pm_api_url
  pm_password       = var.pm_password
  pm_user           = var.pm_user
}

# Block in case you want to use Terraoform Cloud. Must set to use Local in Cloud settings
# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
# 	  organization = "Terraform Cloud Org Name"
	  
# 	  workspaces {
# 	    name = "Workspace Name"
# 	  }
#   }
#}