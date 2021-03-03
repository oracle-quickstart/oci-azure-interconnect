## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# ------ Create Azure Resource Group
resource "azurerm_resource_group" "resource_group" {
  provider = azurerm.azure
  name     = var.azure_resource_group_name
  location = var.azure_region
}

# ------ Create Azure Virtual Network
resource "azurerm_virtual_network" "virtual_network" {
  provider            = azurerm.azure
  name                = var.azure_virtual_network_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = [var.azure_vnet_address]
}

# ------ Create Azure Gateway Subnet
resource "azurerm_subnet" "gateway_subnet" {
  provider             = azurerm.azure
  name                 = var.gateway_subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefix       = var.azure_gateway_subnet
}

# ------ Create Azure Compute Subnet
resource "azurerm_subnet" "compute_subnet" {
  provider             = azurerm.azure
  name                 = var.compute_subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefix       = var.azure_compute_subnet
}

# ------ Create Azure Gateway Public IP
resource "azurerm_public_ip" "gateway_public_ip" {
  provider            = azurerm.azure
  name                = var.gateway_public_ip_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  allocation_method = "Dynamic"
}

# ------ Create Azure Compute VM Public IP
resource "azurerm_public_ip" "machine_public_ip" {
  provider            = azurerm.azure
  name                = var.azure_vm_public_ip_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  allocation_method = "Dynamic"
}

# ------ Create Azure Route Table
resource "azurerm_route_table" "azure_route_table" {
  provider                      = azurerm.azure
  name                          = var.azure_route_table_name
  location                      = azurerm_resource_group.resource_group.location
  resource_group_name           = azurerm_resource_group.resource_group.name
  disable_bgp_route_propagation = false
}

# ------ Create Azure Network Security Group
resource "azurerm_network_security_group" "azure_nsg" {
  provider            = azurerm.azure
  name                = var.azure_nsg_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  security_rule {
    name                       = "ocicomputein"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = oci_core_subnet.compute_subnet.cidr_block
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "ocidatabasein"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = oci_core_subnet.database_subnet.cidr_block
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "admin-in"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${trimsuffix(chomp(trimprefix(data.http.myip.body, "<html><head><title>Current IP Check</title></head><body>Current IP Address: ")), "</body></html>")}/32"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "all"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "0.0.0.0/0"
  }

}

# ------ Associate Network Security Group to Compute Subnet
resource "azurerm_subnet_network_security_group_association" "compute_subnet_network_security_group" {
  provider                  = azurerm.azure
  subnet_id                 = azurerm_subnet.compute_subnet.id
  network_security_group_id = azurerm_network_security_group.azure_nsg.id
}

# ------ Associate Network Security Group to Compute VM NIC
resource "azurerm_network_interface_security_group_association" "compute_nic_network_security_group" {
  provider                  = azurerm.azure
  network_interface_id      = azurerm_network_interface.compute_vm_vnic.id
  network_security_group_id = azurerm_network_security_group.azure_nsg.id
}

# ------ Associate Route Table to Compute Subnet
resource "azurerm_subnet_route_table_association" "compute_subnet_route_table_associate" {
  provider       = azurerm.azure
  subnet_id      = azurerm_subnet.compute_subnet.id
  route_table_id = azurerm_route_table.azure_route_table.id
}

# ------ Associate Route Table to Gateway Subnet
resource "azurerm_subnet_route_table_association" "gateway_subnet_route_table_associate" {
  provider       = azurerm.azure
  subnet_id      = azurerm_subnet.gateway_subnet.id
  route_table_id = azurerm_route_table.azure_route_table.id
}
