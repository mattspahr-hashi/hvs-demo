# hvs-demo

Project is used to demo HCP Vault Secrets.

[Outline Notes](https://www.notion.so/hashicorp/HVS-Secrets-Sync-Demo-Outline-fa7b53acf6b244788bf2e1df0fbdda7c)

## Usage
1. ```cd scaffold```
2. ```terraform init```
3. ```terraform apply```
4. This will provision a new demo environment:
      1. ```DEMO_SECRET``` in the HVS App
      2. ```TF_API_TOKEN``` in the HVS App with no value
      3. ```DATABASE_USERNAME``` in the HVS App
      4. ```DATABASE_PASSWORD``` in the HVS App
   1. Output:
      1. ```terraform_org_token``` : Used for HVS Secret Sync with HCP Terraform
5. Create new Secret Sync with HCP Terraform
   1. Use ```hvs-terraform-demo-app```
6. Create new HCP Terraform User Token & set value of ```TF_API_TOKEN```
7. Create Secrets Sync with Github Actions
   1. Use ```hvs-github-demo-app```
8. ```cd .. && cd app```
9. **Demo**

## Folder Structure

```scaffold```: Directory used for scaffolding out the demo environment

```app```: Directory used for demoing functionality

```.github```: Directory contains all github-actions workflows
