#!/bin/bash

# CREATE VPC
cd terraform-jobs
cd infrastructure_vpc
ls
terraform init
terraform apply --auto-approve