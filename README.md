# hvs-demo

Project is used to demo HCP Vault Secrets.
- Secret Sync with Github Actions
- Secret Sync with HCP Terraform
- Direct Retrieval with HCP Project Service Principal, HVS, & Terraform

[Demo Outline Notes](https://docs.google.com/document/d/1h5cBMu_4UuvnHehlF3gfMVEbtdZdUQF0ILY9fmKR9BE)

## Usage
1. ```cd scaffold```
2. ```hcp auth login```
3. ```terraform init```
4. ```terraform apply```
5. This will provision a new demo environment with projects, apps, & workspaces configured:
   1. **HVS**
      2. ```STRIPE_API_KEY``` in the HVS Retrieval App
      3. ```TF_API_TOKEN``` in the HVS Github App with no value
      4. ```DATABASE_USERNAME``` in the HVS Terraform App
      5. ```DATABASE_PASSWORD``` in the HVS Terraform App
   3. **HCP Terraform**
         1. HCP Credentials added as variable set
   4. **Output:**
      1. ```terraform_org_token``` : Used for HVS Secret Sync with HCP Terraform
7. Create new Secret Sync with HCP Terraform
   1. Use ```terraform-demo-app```
8. Create Secrets Sync with Github Actions
   1. Use ```github-demo-app```
9. **Demo**

## Folder Structure

```scaffold```: Contains scaffolding out the demo environment

```app```: Cointains demo functionality

```.github```: Contains all github-actions workflows
