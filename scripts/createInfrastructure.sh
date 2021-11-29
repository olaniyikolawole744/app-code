#!/bin/bash
# CREATE AMI
echo "creating ami..................................................................."
cd ..
cd packer
docker-compose -f docker-compose.yml run --rm packer init golden_image_ami222.pkr.hcl
docker-compose -f docker-compose.yml run --rm packer build golden_image_ami222.pkr.hcl
cd ..

# CREATE VPC
echo "creating vpc...................................................................."
cd terraform-jobs
cd vpc_module
ls
docker-compose -f docker-compose.yml run --rm terraform init
docker-compose -f docker-compose.yml run --rm terraform apply --auto-approve
cd ..

# CREATE TOOL SERVER
echo "creating tool server.............................................................."
cd tool_server
ls
docker-compose -f docker-compose.yml run --rm terraform init
docker-compose -f docker-compose.yml run --rm terraform apply "-var-file=variable_values.tfvars" --auto-approve
