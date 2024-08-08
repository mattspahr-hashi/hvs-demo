resource "tfe_project" "tfc_project" {
  name = "hvs-demo-project"
}

resource "tfe_workspace" "tfc_workspace" {
  name       = "hvs-demo-workspace"
  project_id = tfe_project.tfc_project.id
}

resource "hcp_service_principal" "github-actions-sp" {
  name   = "github-actions"
  parent = hcp_project.project.resource_name
}

resource "hcp_service_principal_key" "key" {
  service_principal = hcp_service_principal.github-actions-sp.resource_name
}

resource "tfe_variable_set" "hcp_credentials" {
  name         = "HCP Credentials"
  organization = "mattspahr-sandbox"
}

resource "tfe_workspace_variable_set" "service_principal_var_set" {
  workspace_id    = tfe_workspace.tfc_workspace.id
  variable_set_id = tfe_variable_set.hcp_credentials.id
}

resource "tfe_variable" "hcp_client_id" {
  key             = "HCP_CLIENT_ID"
  value           = hcp_service_principal_key.key.client_id
  category        = "env"
  description     = "a useful description"
  sensitive       = true
  variable_set_id = tfe_variable_set.hcp_credentials.id
}

resource "tfe_variable" "hcp_client_secret" {
  key             = "HCP_CLIENT_SECRET"
  value           = hcp_service_principal_key.key.client_secret
  category        = "env"
  description     = "a useful description"
  sensitive       = true
  variable_set_id = tfe_variable_set.hcp_credentials.id
}

resource "random_string" "random" {
  length  = 16
  special = true
}
output "random_string" {
  value = random_string.random.result
}
