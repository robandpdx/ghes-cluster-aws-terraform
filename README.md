# GHES Custler on AWS with Terraform

This repo contains a terraform template for creating a GHES cluster with 5 nodes.  

1. Copy the `.envrc-sample` file to `.envrc` and populate with the values needed.  
2. Run `terraform plan -out=tfplan`  
3. Run `terraform apply tfplan`  
4. Profit!  