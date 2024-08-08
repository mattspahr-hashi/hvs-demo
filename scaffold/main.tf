# Project for HVS Demo
resource "hcp_project" "project" {
  name        = "hvs-demo-project"
  description = "Example project for Demoing HVS"
}

# Service Principal for Github Actions
resource "hcp_service_principal" "github-actions-sp" {
  name   = "github-actions"
  parent = hcp_project.project.resource_name
}

# Service Principal Keys for Github Actions Auth
resource "hcp_service_principal_key" "key" {
  service_principal = hcp_service_principal.github-actions-sp.resource_name
}
