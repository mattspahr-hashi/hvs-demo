# App for HVS Demo
resource "hcp_vault_secrets_app" "app" {
  project_id  = hcp_project.project.resource_id
  app_name    = "hvs-demo-app"
  description = "Example app for Demoing HVS"
}

# Secret for Retrieval Demo
resource "hcp_vault_secrets_secret" "secret" {
  app_name     = hcp_vault_secrets_app.app.app_name
  project_id   = hcp_project.project.resource_id
  secret_name  = "DEMO_SECRET"
  secret_value = "first-secret-value"
}

# Secret for Retrieval Demo
resource "hcp_vault_secrets_secret" "tf_api_secret" {
  app_name     = hcp_vault_secrets_app.app.app_name
  project_id   = hcp_project.project.resource_id
  secret_name  = "TF_API_TOKEN"
  secret_value = ""
}
