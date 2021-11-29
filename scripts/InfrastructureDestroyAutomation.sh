#!/bin/bash
# CREATE TOOL SERVER
cd ..
cd terraform-jobs
cd tools_server
terraform init
terraform destroy "-var-file=variable_values.tfvars" --auto-approve
cd ..
cd remote_servers
terraform init
terraform destroy "-var-file=infrastructure_values.tfvars" --auto-approve
cd ..
cd terraform-jobs
cd infrastructure_vpc
terraform init
terraform destroy --auto-approve