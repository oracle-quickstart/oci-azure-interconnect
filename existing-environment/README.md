# oci-azure-interconnect

In this repository you will be utilizing existing OCI/Azure enviornment where you would like to setup an interconnect circuit.

## Prerequisites

You should complete below pre-requisites before proceeding to next section:
- You have an active Oracle Cloud Infrastructure Account.
- You have an active subscription to Microsoft Azure
- You have a working OCI enviornment which you want to connect to Azure: `drg` OCID is required to connect and setup this circuit,VCN and required subnets, VMs, routes and security policies are present.
- You have a working Azure enviornment which you want to connect to OCI: `resource-group`, `virtual-network`, `gateway-subnet`, `gateway-subnet-public-ip` are required manadatory parameters which you need add in your variable file.
- Permission to `manage` the following types of resources in your Oracle Cloud Infrastructure tenancy and Microsoft Azure: `virtual-circuits`, `expressroutes`, `vnet gateways`.

Tested enviornment: 
```
➜  oci-azure-interconnect git:(main) terraform -v 

Your version of Terraform is out of date! The latest version
is 0.14.7. You can update by downloading from https://www.terraform.io/downloads.html
Terraform v0.13.0
+ provider registry.terraform.io/hashicorp/azurerm v2.20.0
+ provider registry.terraform.io/hashicorp/http v2.1.0
+ provider registry.terraform.io/hashicorp/oci v4.15.0
```

## Deployment 

You can follow below setps to deploy this setup in your account: 

1. Create a local copy of this repo using below command on your terminal: 

    ```
    https://github.com/oracle-quickstart/oci-azure-interconnect.git
    cd oci-azure-interconnect
    ls
    ```

2. Complete the prerequisites described [here] which are associated to install **Terraform** locally:(https://github.com/oracle-quickstart/oci-prerequisites#install-terraform).
    Make sure you have terraform v0.13+ cli installed and accessible from your terminal.

    ```bash
    ➜  oci-azure-interconnect git:(main) terraform -v 

    Your version of Terraform is out of date! The latest version
    is 0.14.7. You can update by downloading from https://www.terraform.io/downloads.html
    Terraform v0.13.0
    + provider registry.terraform.io/hashicorp/azurerm v2.20.0
    + provider registry.terraform.io/hashicorp/http v2.1.0
    + provider registry.terraform.io/hashicorp/oci v4.15.0
    ```

3. Create a `terraform.tfvars` file in your **oci-azure-interconnect** directory, and specify the following variables:

    ```
    # Authentication
    tenancy_ocid         = "<tenancy_ocid>"
    user_ocid            = "<user_ocid>"
    fingerprint          = "<finger_print>"
    private_key_path     = "<pem_private_key_pem_file_path>"

    # SSH Keys
    ssh_public_key  = "<public_ssh_key_string_value>"

    # Region
    region = "<oci_region>"

    # DRG 
    drg_ocid = "<drg_ocid>"

    # Compartment
    compartment_ocid = "<compartment_ocid>"
    availability_domain_number = "<availability_domain_number>

    ## Azure Variables 
    bandwidth="<virtial_cricuit_bandwidth>"
    azure_region="<azure_region>"
    peering_location="<peered_location>"
    resource_group_name="<azure_resource_group_name>"
    azure_virtual_network_name="<azure_virtual_network_name>"
    gateway_subnet_name="<azure_virtual_network_gateway_subnet_name>"
    gateway_public_ip_name="<azure_virtual_network_gateway_subnet_public_ip>"
    ````

4. Login to Microsoft Azure from CLI using **az login**. If you don't have Azure CLI utility installed locally you will have to do that first. This will allow Azure terraform providor to manage resources on Azure enviornment.

5. Create the Resources using the following commands:

    ```bash
    terraform init
    terraform plan
    terraform apply
    ```

6. At this point your circuit should be up and you can connect to test VMs on both end and validate connectivity using ping/ssh and check latency. 

7. If you no longer require your infrastructure, you can run this command to destroy the resources in following orders:

    ```bash
    terraform destroy -target azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection
    ```
    > Note: End user noticed virtual circuit goes in failed state during deletion. So you should delete the circuit connection first and then continue with destroy command.

    ```bash
    terraform destroy 
    ```

## Feedback 

Feedbacks are welcome to this repo, please open a PR if you have any.