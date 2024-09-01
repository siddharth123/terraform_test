variable "databricks_host" {
  description = "Databricks Cluster Host"
  type        = string
  default     = ""
  sensitive   = true
}

variable "databricks_token" {
  description = "Databricks Host Token"
  type        = string
  default     = ""
  sensitive   = true
}

variable "existing_cluster_id" {
  description = "Existing Cluster ID"
  type        = string
  default     = ""
  sensitive   = true
}

variable "git_provider" {
  description = "Git Provider"
  type        = string
  default = "bitbucketCloud"
}

variable "git_user" {
  type    = string
  default = ""
}

variable "git_token" {
  type      = string
  default   = ""
  sensitive = true
}