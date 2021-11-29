#!/bin/bash
cd ansible-jobs
chmod 755 inventory/hosts/ec2.py
chmod 755 inventory/hosts/ec2.ini
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook/playdev.yml -i inventory/hosts/ec2.py --vault-password-file $ANSIBLE_VAULT_PASSWORD_FILE 