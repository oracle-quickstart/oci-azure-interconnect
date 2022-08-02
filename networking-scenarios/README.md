# OCI/Azure Interconnect Network Scenarios and Resources

OCI/Azure Interconnect provides a low latency, private connection between two leading cloud providers which brings innovation while maximizing return on investment. Customers can innovate using the best of [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/) (OCI) and [Microsoft Azure](https://azure.microsoft.com/en-us/) with seamless interoperability. 

This article provides different networking scenarios about networking, limitations, and resources. For more detailed example of setting up OCI/Azure Interconnect with Cloud Consoles or Automation, see: [Step-by-Step Guide: Interconnecting Oracle Cloud Infrastructure and Microsoft Azure](https://blogs.oracle.com/cloud-infrastructure/post/step-by-step-guide-interconnecting-oracle-cloud-infrastructure-and-microsoft-azure). 

## Scenarios: 
Interconnect deployed into an [Azure virtual network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview) and [OCI virtual cloud network](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingVCNs_topic-Overview_of_VCNs_and_Subnets.htm) enable networking scenarios like:
- Interconnect communication between workloads in a single virtual cloud network to virtual network. Enable communication through [DRG](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingDRGs.htm) and [VPN ER Gateway](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways). 
- Interconnect communication between workloads in a single virtual cloud network to virtual network. Enable communication through [DRG](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingDRGs.htm) and [VWAN](https://docs.microsoft.com/en-us/azure/virtual-wan/virtual-wan-about). 
- Hub & Spoke interconnect communication between workloads in virtual cloud network to virtual network. Enable communication between spokes through a 3rd party Firewall available in Hub VCN/VNET with [DRG](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingDRGs.htm) and [VPN ER Gateway](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways) or [VWAN](https://docs.microsoft.com/en-us/azure/virtual-wan/virtual-wan-about).
- Hub & Spoke interconnect communication between workloads in virtual cloud network to virtual network. Enable communication between spokes through a 3rd party Firewall available in Hub VCN/VNET and Azure Route Server with DRG and VPN ER Gateway or VWAN.
- Transit Routing from On-Prem > Azure > OCI or On-Prem > OCI > Azure via Network Virtual Appliance. 

## Unsupported networking scenarios

- Document where which scenario is not supported. 
  - Pricing and Other Limitations:
- Document pricing and other limitation which are not supported. 

## First Scenario: Interconnect Connectivity between OCI VCN and Azure VNET

OCI and Azure provides interconnected regions where it’s possible. This allows end users to achieve both cloud services using OCI/Azure interconnect connectivity which is a private peering and a networking service. 

We will document initial use-case which will include configuration, pricing, and additional details. 
 
![](./images/scenario1.png)
Figure 1: Use-Case Network Topology 

### Required network resources: 

This section includes necessary resources configuration to support this scenario. 

- Add configuration details. 

#### OCI: Virtual Cloud Network

#### OCI: Subnet 

- Add configuration details. 

#### OCI: Dynamic Routing Gateway 

- Add configuration details. 

#### Azure: Virtual Network

- Add configuration details. 

#### Azure: Subnet 

- Add configuration details. 

#### Azure: Virtual Network Gateway

- Add configuration details. 

### Required interconnect resources: 

#### Azure: ExpressRoute Circuit

- Add configuration details. 

#### OCI: FastConnect Circuit 

- Add configuration details. 

### Required compute resources: 

#### OCI: Deploy VM Resource 

- Add configuration details. 

#### Azure: Deploy VM Resource 

- Add configuration details. 

### Validation: 

- Add configuration details. 

### Pricing: 

- Add configuration details. 

### Next Steps: 

- Add configuration details. 

## Second Scenario: Interconnect Connectivity between OCI VCN and Azure VNET

OCI and Azure provides interconnected regions where it’s possible. This allows end users to achieve both cloud services using OCI/Azure interconnect connectivity which is a private peering and a networking service. 

We will document initial use-case which will include configuration, pricing, and additional details. 
 
Figure 1: Use-Case Topology 

### Required network resources: 

This section includes necessary resources configuration to support this scenario. 

#### OCI: Virtual Cloud Network

- Add configuration details. 

#### OCI: Subnet 

- Add configuration details. 

#### OCI: Dynamic Routing Gateway 

- Add configuration details. 

### Azure: Virtual Network

- Add configuration details. 

### Azure: Subnet 

- Add configuration details. 

### Azure: Virtual Network Gateway

- Add configuration details. 

### Required interconnect resources: 

#### Azure: ExpressRoute Circuit

- Add configuration details. 

#### OCI: FastConnect Circuit 

- Add configuration details. 

### Required compute resources: 

#### OCI: Deploy VM Resource 

- Add configuration details. 

#### Azure: Deploy VM Resource 

- Add configuration details. 

### Validation: 

- Add configuration details. 

### Pricing: 

- Add configuration details. 

### Next Steps: 

- Add configuration details. 

## Additional Scenarios: Interconnect Connectivity between OCI VCN and Azure VNET

More Details 

## Feedback 

Feedbacks are welcome to this repository, you can open an issue and/or PR accordingly.
