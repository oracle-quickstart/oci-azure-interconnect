# ------ Initialize Azure Terraform required_providers
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.0"
    }
    oci = {
      source = "oracle/oci"
      version = ">=3.0.0"
    }
  }
}

# ------ Initialize Azure Terraform provider
provider "azurerm" {
  alias   = "azure"
  features {}
}

# ------ Initialize Oracle Terraform provider
provider "oci" {
  alias            = "oci"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

