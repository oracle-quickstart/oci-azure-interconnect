## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# ------ Get a List of Availability Domain
data "oci_identity_availability_domain" "AD" {
  provider       = oci.oci
  compartment_id = var.tenancy_ocid
  ad_number      = "1"
}

# ------ Get the OCI Tenancy Details
data "oci_identity_tenancy" "tenancy" {
  provider   = oci.oci
  tenancy_id = var.tenancy_ocid
}

# ------ Get the OCI Fast Connect Providors Details
data "oci_core_fast_connect_provider_services" "test_fast_connect_provider_services" {
  provider       = oci.oci
  compartment_id = var.compartment_ocid
}

# ------ Get the Microsoft Azure Providor Details
data "oci_core_fast_connect_provider_service" "test_fast_connect_provider_service" {
  provider            = oci.oci
  provider_service_id = "${lookup(element(data.oci_core_fast_connect_provider_services.test_fast_connect_provider_services.fast_connect_provider_services, index(data.oci_core_fast_connect_provider_services.test_fast_connect_provider_services.fast_connect_provider_services.*.provider_name, "Microsoft Azure")), "id")}"
}

# ------ Define a Variable for Shape
variable "shape" {
  type = map
  default = {
    10000 = "10 Gbps"
    5000  = "5 Gbps"
    2000  = "2 Gbps"
    1000  = "1 Gbps"
    50    = "1 Gbps" #Test bandwidth
  }
}

data "http" "myip" {
  url = "http://checkip.dyndns.com/"
}

# ------ Get the latest Oracle Linux image
data "oci_core_images" "InstanceImageOCID" {
  provider            = oci.oci
  compartment_id = var.compartment_ocid
  # operating_system         = var.instance_os
  # operating_system_version = var.linux_os_version

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}
