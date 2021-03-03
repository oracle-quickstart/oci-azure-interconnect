## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

############################
#  OCI Tenancy Credentials #
############################

variable "tenancy_ocid" {
  description = "User Tenancy OCID"
}

variable "compartment_ocid" {
  description = "User Compartment OCID"
}

variable "region" {
  description = "User Region Value"
}

variable "user_ocid" {
  description = "User OCID"
}

variable "fingerprint" {
  description = "User Private Key Fingerprint"
}

variable "private_key_path" {
  description = "User Private Key Path"
}

variable "ssh_public_key" {
  description = "SSH Public Key String"
}

############################
# Azure Region Credentials #
############################

variable "azure_region" {
  description = "Azure Region Name"
}

variable "peering_location" {
  description = "Azure Peering Location Where OCI providor exists"
}

variable "bandwidth" {
  description = "Azure ExpressRoute Circuit Bandwidth"
}

############################
# Instance Credentials #
############################

variable "InstanceShape" {
  description = "Instance Default Size"
  default     = "VM.Standard2.1"
}

variable "InstanceImageOCID" {
  description = "Instance Image OCID Associated with Each Region"
  type        = map
  default = {
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // Oracle-provided image "Oracle-Linux-7.4-2018.02.21-1"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaupbfz5f5hdvejulmalhyb6goieolullgkpumorbvxlwkaowglslq"
    us-sanjose-1   = "ocid1.image.oc1.us-sanjose-1.aaaaaaaanwz2yn524lxipjoupop7cjcmy5r4znohz2gbjcxmgzxf4xjs7q3a"
    ca-toronto-1   = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasbx5hzms4eyrs6e3woez6zxxnfd7yuqtc6bg53jiqevoe52ob4qq"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaajlw3xfie2t5t52uegyhiq2npx7bqyu4uvi2zyu3w3mqayc2bxmaa"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa7d3fsb6272srnftyi4dphdgfjf6gurxqhmv6ileds7ba3m2gltxq"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaaa6h6gj6v4n56mqrbgnosskq63blyv2752g36zerymy63cfkojiiq"
    eu-amsterdam-1 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaakuiz2wmx7ticqlfr2skyizauwfv4wasuttoabekqzckjp6ggsnsa"
  }
}

############################
# Azure Variables  #
############################

variable "azure_resource_group_name" {
  description = "Azure Resource Group Name"
  default     = "azure_oci_test_resources"
}

variable "azure_vnet_address" {
  description = "Azure VNET Address Range"
  default     = "10.12.0.0/16"
}

variable "azure_gateway_subnet" {
  description = "Azure Gateway Subnet Address Range"
  default     = "10.12.1.0/24"
}

variable "azure_compute_subnet" {
  description = "Azure Compute Subnet Address Range"
  default     = "10.12.2.0/24"
}

variable "azure_compute_vnic_name" {
  description = "Azure Compute VM NIC Name"
  default     = "compute-vm-nic"
}

variable "azure_compute_machine_name" {
  description = "Azure Compute VM Name"
  default     = "azure-compute-name"
}

variable "azure_express_circuit_name" {
  description = "Azure Express Route circuit Name"
  default     = "azure_express_circuit"
}

variable "azure_virtual_network_name" {
  description = "Azure Virtual Network Name"
  default     = "oci_network"
}

variable "gateway_subnet_name" {
  description = "Azure Gateway Subnet Name"
  default     = "GatewaySubnet"
}

variable "compute_subnet_name" {
  description = "Azure Compte Subnet Name for VMs"
  default     = "ComputeSubnet"
}

variable "gateway_public_ip_name" {
  description = "Azure Gateway Public IP Name"
  default     = "GatewayPublicIP"
}

variable "azure_vm_public_ip_name" {
  description = "Azure VM Public IP Name"
  default     = "AzureVMPublicIP"
}

variable "azure_route_table_name" {
  description = "Azure Route Table Name"
  default     = "azure_route_table"
}

variable "azure_nsg_name" {
  description = "Azure Network Security Group Name"
  default     = "azure-oci-nsg"
}

variable "virtual_network_gateway_name" {
  description = "Azure Network Gateway Name"
  default     = "InterConnectVNETGateway"
}

variable "virtual_network_gateway_connection_name" {
  description = "Azure Network Gateway Connection Name"
  default     = "azure_to_oci"
}

###########################################
#  Oracle Cloud Infrastructure Variables  #
###########################################

variable "interconnect_vcn_cidr_block" {
  description = "Interconnect VCN CIDR"
  default     = "10.1.0.0/16"
}

variable "oci_compute_subnet_display_name" {
  description = "Compute Subnet Name"
  default     = "ComputeSubnet"
}

variable "oci_compute_subnet" {
  description = "Compute Subnet CIDR"
  default     = "10.1.10.0/24"
}

variable "oci_compute_subnet_dns_label" {
  description = "Compute Subnet DNS Label"
  default     = "computesubnet"
}

variable "oci_database_subnet_display_name" {
  description = "Compute Subnet Name"
  default     = "DatabaseSubnet"
}

variable "oci_database_subnet" {
  description = "Database Subnet CIDR"
  default     = "10.1.20.0/24"
}

variable "oci_database_subnet_dns_label" {
  description = "Database Subnet DNS Label"
  default     = "databasesubnet"
}

variable "internet_gateway_name" {
  description = "OCI Internet Gateway Name"
  default     = "IGW"
}

variable "compute_route_table_display_name" {
  description = "OCI Compute Route Table Name"
  default     = "ComputeRouteTable"
}

variable "database_route_table_display_name" {
  description = "OCI Database Route Table Name"
  default     = "DatabaseRouteTable"
}

variable "security_policy_name" {
  description = "OCI Security Policy Name"
  default     = "AzureSecurityList"
}

variable "oci_compute_instance_name" {
  description = "OCI Compute VM Name"
  default     = "ComputeVM"
}
