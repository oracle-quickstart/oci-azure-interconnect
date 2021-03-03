## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# ------ Output Azure VM Public IP
output "azure_server_public_ip" {
  value = azurerm_linux_virtual_machine.azure_compute_vm.public_ip_address
}

# ------ Output Oracle Server Public IP
output "oracle_server_public_ip" {
  value = oci_core_instance.oci_compute_instance.public_ip
}

# ------ Initial Instructions
output "initial_instruction" {
value = <<EOT
1.  Open an SSH client.
2.  Use the following information to connect to the instances:
Azure VM Connection 
1. SSH to VM using your private key and adminuser username: adminuser@${azurerm_linux_virtual_machine.azure_compute_vm.public_ip_address}
OCI VM Connection: 
1. SSH to VM using your private key and opc username: opc@${oci_core_instance.oci_compute_instance.public_ip}
SSH Key
For example:
$ ssh –i id_rsa adminuser@82.32.XX.XX
After you connect to each instances you can do a ping test using private IP from Each VM. 
EOT
}