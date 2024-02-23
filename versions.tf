terraform {
  required_version = ">= 1.4.5"
  required_providers {
    google = {
      source  = "hashicorp/vsphere"
      version = "2.6.1"
    }
  }
}
