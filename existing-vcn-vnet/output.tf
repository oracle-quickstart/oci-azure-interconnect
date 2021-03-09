# ------ Initial Instructions
output "initial_instruction" {
value = <<EOT
This module completes setting up the 
1. If you wish to test interconnect circuit, you need to create VMs on both ends (Azure and OCI)
2. Setup required network secruity groups and route tables to asscociate traffic flow.
After you connect to each instances you can do a ping test using private IP from Each VM. 
EOT
}