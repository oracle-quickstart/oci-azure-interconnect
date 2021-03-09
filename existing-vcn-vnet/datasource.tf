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


# ------ Get the Azure Resource Group Details
data "azurerm_resource_group" "resource_group" {
  provider = azurerm.azure
  name     = var.resource_group_name
}

# ------ Get the Azure Gateway Subnet Details
data "azurerm_subnet" "gateway_subnet" {
  provider             = azurerm.azure
  name                 = var.gateway_subnet_name
  virtual_network_name = var.azure_virtual_network_name
  resource_group_name  = var.resource_group_name
}

# ------ Get the Azure Gateway Public IP Details
data "azurerm_public_ip" "gateway_public_ip" {
  provider            = azurerm.azure
  name                = var.gateway_public_ip_name
  resource_group_name = var.resource_group_name
}
