## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# ------ Create Virtual Network Gateway on Azure
resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  provider            = azurerm.azure
  name                = var.virtual_network_gateway_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  type = "ExpressRoute"
  sku  = "UltraPerformance"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.gateway_public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}

# ------ Create Virtual Network Gateway ExpressRoute Connection 
resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection" {
  provider                     = azurerm.azure
  name                         = var.virtual_network_gateway_connection_name
  location                     = azurerm_resource_group.resource_group.location
  resource_group_name          = azurerm_resource_group.resource_group.name
  express_route_gateway_bypass = "true"
  type                         = "ExpressRoute"
  virtual_network_gateway_id   = azurerm_virtual_network_gateway.virtual_network_gateway.id
  express_route_circuit_id     = azurerm_express_route_circuit.express_route_circuit.id
}
