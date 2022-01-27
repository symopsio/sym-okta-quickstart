variable "connector_environment" {
  description = "Environment name for shared connectors and integrations"
  type        = string
  default     = "shared"
}

variable "error_logger_prod" {
  description = "The error channel to use to surface Sym errors for prod flows"
  type        = string
  default     = "#sym-errors"
}

variable "error_logger_sandbox" {
  description = "The error channel to use to surface Sym errors for sandbox flows"
  type        = string
  default     = "#sym-errors-sandbox"
}

variable "okta_org_domain" {
  description = "Domain of the Okta account to use for this flow. Example: 'my-org.okta.com'"
  type        = string
}

variable "runtime_settings" {
  description = "Settings to supply to the runtime permission context"
  type        = map(string)
}

variable "slack_workspace_id" {
  description = "The Slack Workspace ID to use for your Slack integration"
  type        = string
}

