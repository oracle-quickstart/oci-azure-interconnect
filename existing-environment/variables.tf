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

variable "drg_ocid" {
  description = "OCID of DRG for FastConnect Circuit"
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
# Azure Variables  #
############################

variable "resource_group_name" {
  description = "Azure Resource Group Name"
}

variable "azure_virtual_network_name" {
  description = "Azure Virtual Network Name"
}

variable "gateway_subnet_name" {
  description = "Azure Gateway Subnet Name"
}

variable "gateway_public_ip_name" {
  description = "Azure Gateway Public IP Name"
}

variable "azure_express_circuit_name" {
  description = "Azure Express Route circuit Name"
  default     = "azure_express_circuit"
}

variable "virtual_network_gateway_name" {
  description = "Azure Network Gateway Name"
  default     = "InterConnectVNETGateway"
}

variable "virtual_network_gateway_connection_name" {
  description = "Azure Network Gateway Connection Name"
  default     = "azure_to_oci"
}
