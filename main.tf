resource "tfe_project" "tfc_project" {
  name = "hvs-demo-project"
}

resource "tfe_workspace" "tfc_workspace" {
  name       = "hvs-demo-workspace"
  project_id = tfe_project.tfc_project.id
}

resource "hcp_service_principal" "github-actions-sp" {
  name = "github-actions"
}

resource "hcp_service_principal_key" "key" {
  service_principal = hcp_service_principal.github-actions-sp.name
}

resource "tfe_variable_set" "var_set" {
  name         = "HCP Credentials"
  organization = "mattspahr-sandbox"
}

resource "tfe_workspace_variable_set" "service_principal_var_set" {
  workspace_id    = tfe_workspace.tfc_workspace.id
  variable_set_id = tfe_variable_set.var_set.id
}

resource "random_string" "random" {
  length  = 16
  special = true
}
output "random_string" {
  value = random_string.random.result
}
