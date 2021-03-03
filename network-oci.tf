## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# ------ Create OCI VCN 
resource "oci_core_vcn" "interconnect_vcn" {
  provider       = oci.oci
  cidr_block     = var.interconnect_vcn_cidr_block
  compartment_id = var.compartment_ocid
  display_name   = "InterConnect VCN"
  dns_label      = "interconnectvcn"
}

# ------ Create Public Compute Subnet
resource "oci_core_subnet" "compute_subnet" {
  provider            = oci.oci
  availability_domain = data.oci_identity_availability_domain.AD.name
  cidr_block          = var.oci_compute_subnet
  display_name        = var.oci_compute_subnet_display_name
  dns_label           = var.oci_compute_subnet_dns_label
  security_list_ids   = [oci_core_security_list.security_policies_azure.id]
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_vcn.interconnect_vcn.id
  route_table_id      = oci_core_route_table.compute_route_table.id
  dhcp_options_id     = oci_core_vcn.interconnect_vcn.default_dhcp_options_id
}

# ------ Create Private Database Subnet
resource "oci_core_subnet" "database_subnet" {
  provider            = oci.oci
  availability_domain = data.oci_identity_availability_domain.AD.name
  cidr_block          = var.oci_database_subnet
  display_name        = var.oci_database_subnet_display_name
  dns_label           = var.oci_database_subnet_dns_label

  security_list_ids = [oci_core_security_list.security_policies_azure.id]
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_vcn.interconnect_vcn.id
  route_table_id    = oci_core_route_table.database_route_table.id
  dhcp_options_id   = oci_core_vcn.interconnect_vcn.default_dhcp_options_id

  prohibit_public_ip_on_vnic = "true"
}

# ------ Create OCI VCN Internet Gateway
resource "oci_core_internet_gateway" "internet_gateway" {
  provider       = oci.oci
  compartment_id = var.compartment_ocid
  display_name   = var.internet_gateway_name
  vcn_id         = oci_core_vcn.interconnect_vcn.id
}

# ------ Create OCI Compute Route Table
resource "oci_core_route_table" "compute_route_table" {
  provider       = oci.oci
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.interconnect_vcn.id
  display_name   = var.compute_route_table_display_name

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
  route_rules {
    destination       = azurerm_virtual_network.virtual_network.address_space[0]
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.drg_azure.id
  }
}

# ------ Create OCI Database Route Table
resource "oci_core_route_table" "database_route_table" {
  provider       = oci.oci
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.interconnect_vcn.id
  display_name   = var.database_route_table_display_name

  route_rules {
    destination       = azurerm_virtual_network.virtual_network.address_space[0]
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_drg.drg_azure.id
  }
}

# ------ Create DRG on OCI 
resource "oci_core_drg" "drg_azure" {
  provider       = oci.oci
  compartment_id = var.compartment_ocid
}

# ------ Create Security Policies on Azure
resource "oci_core_security_list" "security_policies_azure" {
  provider       = oci.oci
  compartment_id = var.compartment_ocid
  display_name   = var.security_policy_name
  vcn_id         = oci_core_vcn.interconnect_vcn.id

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "all"
    source   = azurerm_virtual_network.virtual_network.address_space[0]
  }

  ingress_security_rules {
    protocol = "all"
    source   = "0.0.0.0/0"
  }

}

# ------ Create DRG Attachment on Azure
resource "oci_core_drg_attachment" "drg_attachment" {
  provider = oci.oci
  drg_id   = oci_core_drg.drg_azure.id
  vcn_id   = oci_core_vcn.interconnect_vcn.id
}
