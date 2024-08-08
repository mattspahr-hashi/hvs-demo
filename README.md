# hvs-demo

Project is used to demo HCP Vault Secrets.

[Outline Notes](https://www.notion.so/hashicorp/HVS-Secrets-Sync-Demo-Outline-fa7b53acf6b244788bf2e1df0fbdda7c)

## Usage
1. If not authenticated: ```hcp auth login```
2. ```terraform init && terraform apply```
   1. This will prompt you for a HCP Terraform User Token
   2. This will provision a new:
      1. HCP Project
      2. HVS App
      3. DEMO_SECRET in the HVS App
      4. TF_API_TOKEN in the HVS App with no value
3. Create new HCP Terraform User Token & set value of TF_API_TOKEN
4. Create Secrets Sync with Github Actions
5. Create API Driven Workflow + GH Actions