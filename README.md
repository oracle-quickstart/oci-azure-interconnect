# oci-azure-interconnect

This repository allows you to setup an Interconnect between Oracle Cloud Infrastrcture and Microsoft Azure.

## Prerequisites

You should complete below pre-requisites before proceeding to next section:
- You have an active Oracle Cloud Infrastructure Account.
- You have an active subscription to Microsoft Azure
- Permission to `manage` the following types of resources in your Oracle Cloud Infrastructure tenancy and Microsoft Azure: `vcns`, `internet-gateways`, `route-tables`, `security-lists`, `subnets`, `instances`, `vnet`, `vnet gateways`.

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

    # Compartment
    compartment_ocid = "<compartment_ocid>"
    availability_domain_number = "<availability_domain_number>

    ## Azure Variables 
    bandwidth="<virtial_cricuit_bandwidth>"
    azure_region="<azure_region>"
    peering_location="<peered_location>"
    ````

4. Login to Microsoft Azure from CLI using **az login**. If you don't have Azure CLI utility installed locally you will have to do that first. This will allow Azure terraform providor to manage resources on Azure enviornment.

5. Create the Resources using the following commands:

    ```bash
    terraform init
    terraform plan
    terraform apply
    ```

6. At this point your circuit should be up and you can connect to test VMs on both end and validate connectivity using ping/ssh and check latency. 

7. If you no longer require your infrastructure, you can run this command to destroy the resources:

    ```bash
    terraform destroy
    ```
    > Note: End user noticed virtual circuit goes in failed state during deletion. You can re-run `terraform destroy` command to destroy the enviornment.

## Architecture Diagram 

> Update this throug PR. 

## Feedback 

Feedbacks are welcome to this repo, please open a PR if you have any.