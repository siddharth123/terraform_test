resource "databricks_job" "db_job" {
  name = var.job_name

  # job_cluster {
  #   job_cluster_key = "job_cluster"
  #   new_cluster {
  #     num_workers   = 1
  #     spark_version = var.spark_version
  #     node_type_id  = var.node_type_id
  #   }
  # }

  git_source {
    url = "repo_url"
    provider = "bitbucketCloud"
    branch = "main"
  }

  dynamic "task" {
    for_each = var.tasks
    content {
      task_key        = task.value.task_key
      description     = lookup(task.value, "description", "test_job")
      existing_cluster_id = var.existing_cluster_id

      // Notebook Task
      dynamic "notebook_task" {
        for_each = task.value.task_type == "notebook" ? [1] : []
        content {
          notebook_path = task.value.notebook_path
          source = "GIT"
        }
      }

      // task dependency
      dynamic "depends_on" {
        for_each = task.value.depends_on != null && length(task.value.depends_on) > 0 ? toset(task.value.depends_on) : []
        content {
          task_key = depends_on.value
        }
      }
    }
  }
}