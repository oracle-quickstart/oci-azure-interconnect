# ------ Create Virtual Network Gateway on Azure
resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  provider            = azurerm.azure
  name                = var.virtual_network_gateway_name
  location            = data.azurerm_resource_group.resource_group_name.location
  resource_group_name = var.resource_group_name

  type = "ExpressRoute"
  sku  = "UltraPerformance"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = data.azurerm_public_ip.gateway_public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.gateway_subnet.id
  }
}

# ------ Create Virtual Network Gateway ExpressRoute Connection 
resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection" {
  provider                     = azurerm.azure
  name                         = var.virtual_network_gateway_connection_name
  location                     = data.azurerm_resource_group.resource_group_name.location
  resource_group_name          = var.resource_group_name
  // Below commented line enables Fast Path on ExpressRoute, uncomment it if you need Fast Path (Additional Cost associated with this)
  //express_route_gateway_bypass = "true"
  type                         = "ExpressRoute"
  virtual_network_gateway_id   = azurerm_virtual_network_gateway.virtual_network_gateway.id
  express_route_circuit_id     = azurerm_express_route_circuit.express_route_circuit.id
}
