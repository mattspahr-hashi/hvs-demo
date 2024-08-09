# hvs-demo

Project is used to demo HCP Vault Secrets.

[Outline Notes](https://www.notion.so/hashicorp/HVS-Secrets-Sync-Demo-Outline-fa7b53acf6b244788bf2e1df0fbdda7c)

## Usage
1. ```cd scaffold```
2. ```hcp auth login```
3. ```terraform init```
4. ```terraform apply```
5. This will provision a new demo environment:
      1. ```STRIPE_API_KEY``` in the HVS Retreival App
      2. ```TF_API_TOKEN``` in the HVS Github App with no value
      3. ```DATABASE_USERNAME``` in the HVS Terraform App
      4. ```DATABASE_PASSWORD``` in the HVS Terraform App
   1. Output:
      1. ```terraform_org_token``` : Used for HVS Secret Sync with HCP Terraform
6. Create new Secret Sync with HCP Terraform
   1. Use ```terraform-demo-app```
7. Create Secrets Sync with Github Actions
   1. Use ```github-demo-app```
8. ```cd .. && cd app```
9. **Demo**

## Folder Structure

```scaffold```: Directory used for scaffolding out the demo environment

```app```: Directory used for demoing functionality

```.github```: Directory contains all github-actions workflows
