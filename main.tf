resource "tfe_project" "tfc_project" {
  name = "hvs-demo-project"
}

resource "tfe_workspace" "tfc_workspace" {
  name       = "hvs-demo-workspace"
  project_id = tfe_project.tfc_project.id
}

resource "random_string" "random" {
  length  = 16
  special = true
}
output "random_string" {
  value = random_string.random.result
}
