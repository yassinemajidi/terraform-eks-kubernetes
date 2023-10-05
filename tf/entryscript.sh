#!/bin/sh

# Validate AWS credentials
aws sts get-caller-identity

if [ $? -ne 0 ]; then
    echo "Error: AWS credentials are not valid!"
    exit 1
fi

# Run Terraform commands
terraform init
terraform apply -auto-approve