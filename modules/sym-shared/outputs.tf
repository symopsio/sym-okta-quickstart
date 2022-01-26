output "okta_integration_id" {
  description = "Sym Okta integration ID"
  value       = sym_integration.okta.id
}

output "prod_environment_id" {
  description = "Sym Prod Environment ID"
  value       = sym_environment.prod.id
}

output "sandbox_environment_id" {
  description = "Sym Sandbox Environment ID"
  value       = sym_environment.sandbox.id
}
