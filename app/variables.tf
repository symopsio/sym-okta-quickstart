variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "connector_environment" {
  description = "Environment name for shared connectors and integrations"
  type        = string
  default     = "shared"
}

variable "flow_vars" {
  description = "Configuration values for the Flow implementation python"
  type        = map(string)
  default     = {}
}

variable "okta_org_domain" {
  description = "Domain of the Okta account to use for this flow. Example: 'my-org.okta.com'"
  type        = string
}

variable "okta_targets" {
  description = "List of target config objects. Each object has a label and a group_name."
  type = list(object(
    { label = string, group_id = string }
  ))
}

variable "slack_workspace_id" {
  description = "The Slack Workspace ID to use for your Slack integration"
  type        = string
}

variable "sym_org_slug" {
  description = "Sym org slug for your org"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}
