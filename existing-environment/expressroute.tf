# ------ Create Virtual Circuit
resource "oci_core_virtual_circuit" "virtual_circuit" {
  provider       = oci.oci
  compartment_id = var.compartment_ocid
  type           = "PRIVATE"

  bandwidth_shape_name = var.shape[var.bandwidth]
  cross_connect_mappings {
    customer_bgp_peering_ip = "192.168.240.2/30"
    oracle_bgp_peering_ip   = "192.168.240.1/30"
  }
  cross_connect_mappings {
    customer_bgp_peering_ip = "192.168.240.26/30"
    oracle_bgp_peering_ip   = "192.168.240.25/30"
  }
  gateway_id                = var.drg_ocid
  provider_service_id       = data.oci_core_fast_connect_provider_service.test_fast_connect_provider_service.id
  provider_service_key_name = azurerm_express_route_circuit.express_route_circuit.service_key
  region                    = var.region
}


# ------ Create ExpressRoute Circuit
resource "azurerm_express_route_circuit" "express_route_circuit" {
  provider              = azurerm.azure
  name                  = var.azure_express_circuit_name
  resource_group_name   = var.resource_group_name
  location              = data.azurerm_resource_group.resource_group_name.location
  service_provider_name = "Oracle Cloud FastConnect"
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth

  sku {
    tier   = "Premium"
    family = "MeteredData"
  }
}
