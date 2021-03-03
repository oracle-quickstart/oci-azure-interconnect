## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# ------ Initialize Azure Terraform provider
provider "azurerm" {
  alias   = "azure"
  version = "=2.20.0"
  features {}
}

# ------ Initialize Oracle Terraform provider
provider "oci" {
  alias            = "oci"
  version          = ">= 3.0.0"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

