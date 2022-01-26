variable "flow_vars" {
  description = "Configuration values for the Flow implementation python"
  type        = map(string)
}

variable "okta_integration_id" {
  description = "ID of the Okta integration to use for this Flow"
  type        = string
}

variable "sym_environment_id" {
  description = "Sym Environment ID for this flow"
  type        = string
}

variable "targets" {
  description = "List of target config objects. Each object has a label and a group_name."
  type = list(object(
    { label = string, group_id = string }
  ))
}
