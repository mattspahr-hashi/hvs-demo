# Github App for HVS Demo
resource "hcp_vault_secrets_app" "github-app" {
  project_id  = hcp_project.project.resource_id
  app_name    = "hvs-github-demo-app"
  description = "Example app for Demoing HVS"
}

# Terraform App for HVS Demo
resource "hcp_vault_secrets_app" "terraform-app" {
  project_id  = hcp_project.project.resource_id
  app_name    = "hvs-terraform-demo-app"
  description = "Example app for Demoing HVS"
}

# Secret for Github Pages Retrieval Demo
resource "hcp_vault_secrets_secret" "demo_app_secret" {
  app_name     = hcp_vault_secrets_app.github-app.app_name
  project_id   = hcp_project.project.resource_id
  secret_name  = "STRIPE_API_KEY"
  secret_value = "secret-value-1"
}

# Secret for HCP Terraform Sync
resource "hcp_vault_secrets_secret" "terraform_db_user" {
  app_name     = hcp_vault_secrets_app.terraform-app.app_name
  project_id   = hcp_project.project.resource_id
  secret_name  = "DATABASE_USERNAME"
  secret_value = "root"
}

# Secret for HCP Terraform Sync
resource "hcp_vault_secrets_secret" "terraform_db_password" {
  app_name     = hcp_vault_secrets_app.terraform-app.app_name
  project_id   = hcp_project.project.resource_id
  secret_name  = "DATABASE_PASSWORD"
  secret_value = "rootpassword"
}

# Secret for Github Actions Sync
resource "hcp_vault_secrets_secret" "gh_actions_sync_secret" {
  app_name     = hcp_vault_secrets_app.github-app.app_name
  project_id   = hcp_project.project.resource_id
  secret_name  = "TF_API_TOKEN"
  secret_value = ""
}
