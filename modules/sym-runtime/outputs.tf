output "prod_environment" {
  description = "Sym Prod Environment"
  value       = sym_environment.prod
}

output "runtime_settings" {
  description = "Sym Runtime Connector settings"
  value       = sym_integration.runtime_context.settings
}

output "sandbox_environment" {
  description = "Sym Sandbox Environment"
  value       = sym_environment.sandbox
}

output "secrets_settings" {
  description = "Secrets source and path for shared secret lookups"
  value = {
    source_id = sym_secrets.this.id
    path      = local.resolved_secret_path
  }
}
