variable "account_id_safelist" {
  description = "Additional AWS account IDs where the Sym runtime should be able to assume AWS Roles"
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Environment qualifier for connector resources"
  type        = string
  default     = "shared"
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}
