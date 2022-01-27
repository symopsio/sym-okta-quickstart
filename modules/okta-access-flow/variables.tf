variable "flow_vars" {
  description = "Configuration values for the Flow implementation Python"
  type        = map(string)
}

variable "okta_integration_id" {
  description = "ID of the Okta Integration to use for this Flow"
  type        = string
}

variable "sym_environment_id" {
  description = "Sym Environment ID for this Flow"
  type        = string
}

variable "targets" {
  description = "List of Okta targets that end-users can request access to. Each object has a label and a group_id."
  type = list(object(
    { label = string, group_id = string }
  ))
}
