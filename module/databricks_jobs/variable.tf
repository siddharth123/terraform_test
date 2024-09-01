variable "job_name" {
  description = "job name"
}

variable "num_workers" {
  description = "number of workers required for the job"
}

variable "spark_version" {
  description = "spark version"
}

variable "node_type_id" {
  description = "node type id"
}

variable "tasks" {
  description = "list of tasks"
  type = list(object({
    task_key      = string
    description   = string
    notebook_path = string
    task_type     = string
    depends_on    = list(string)

  }))
}

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