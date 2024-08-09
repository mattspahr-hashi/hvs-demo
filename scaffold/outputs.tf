output "terraform_org_token" {
  value = nonsensitive(tfe_organization_token.org_token.token)
}
