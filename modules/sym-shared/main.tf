# The base permissions that a workflow has access to
resource "sym_integration" "runtime_context" {
  type = "permission_context"
  name = "runtime-${var.connector_environment}"

  external_id = var.runtime_settings.account_id
  settings    = var.runtime_settings
}

# Secrets storage that Sym integrations can refer to
resource "sym_secrets" "this" {
  type = "aws_secrets_manager"
  name = var.connector_environment

  settings = {
    context_id = sym_integration.runtime_context.id
  }
}

# Okta integration
resource "sym_secret" "okta_api_token" {
  path      = "/symops.com/${var.connector_environment}/okta_api_token"
  source_id = sym_secrets.this.id
}

# The Okta integration uses the API key stored in a Sym secret in LD's acct
resource "sym_integration" "okta" {
  type        = "okta"
  name        = var.connector_environment
  external_id = var.okta_org_domain

  settings = {
    api_token_secret = sym_secret.okta_api_token.id
  }
}

# An integration with Slack
resource "sym_integration" "slack" {
  type = "slack"
  name = var.connector_environment

  external_id = var.slack_workspace_id
}

# Declares a runtime where workflows can execute
resource "sym_runtime" "this" {
  name       = var.connector_environment
  context_id = sym_integration.runtime_context.id
}

# Error logger settings
resource "sym_error_logger" "slack_prod" {
  integration_id = sym_integration.slack.id
  destination    = var.error_logger_prod
}

# Error logger settings
resource "sym_error_logger" "slack_sandbox" {
  integration_id = sym_integration.slack.id
  destination    = var.error_logger_sandbox
}

# A sym environment collects together a group of integrations to simplify
# Flow configuration.
resource "sym_environment" "prod" {
  name            = "prod"
  runtime_id      = sym_runtime.this.id
  error_logger_id = sym_error_logger.slack_prod.id

  integrations = {
    slack_id = sym_integration.slack.id
  }
}

# A sym environment collects together a group of integrations to simplify
# Flow configuration.
resource "sym_environment" "sandbox" {
  name            = "sandbox"
  runtime_id      = sym_runtime.this.id
  error_logger_id = sym_error_logger.slack_sandbox.id

  integrations = {
    slack_id = sym_integration.slack.id
  }
}

