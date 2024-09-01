module "sybase_wf_1" {
  source        = "./module/databricks_jobs"
  job_name      = "DL_SYBASE_1"
  num_workers   = 1
  spark_version = "13.3.x-scala2.12"
  node_type_id  = "Standard_DS3_v2"

  tasks = [
    {
      task_key      = "PROC_TASK_1"
      description   = "Sybase Proc_Name"
      task_type     = "notebook"
      notebook_path = "src/NOTEBOOKS/test"
      source        = "GIT"
      depends_on    = []
    },
    {
      task_key      = "PROC_TASK_2"
      description   = "Sybase Proc_Name"
      task_type     = "notebook"
      notebook_path = "src/NOTEBOOKS/test"
      source        = "GIT"
      depends_on    = ["PROC_TASK_1"]
    }
  ]
}

module "oracle_wf_1" {
  source        = "./module/databricks_jobs"
  job_name      = "DL_ORACLE_1"
  num_workers   = 1
  spark_version = "13.3.x-scala2.12"
  node_type_id  = "Standard_DS3_v2"
  tasks = [
    {
      task_key      = "PROC_TASK_1"
      description   = "Sybase Proc_Name"
      task_type     = "notebook"
      notebook_path = "src/NOTEBOOKS/test"
      source        = "GIT"
      depends_on    = []
    },
    {
      task_key      = "PROC_TASK_2"
      description   = "Demo2"
      task_type     = "notebook"
      notebook_path = "src/NOTEBOOKS/test"
      source        = "GIT"
      depends_on    = ["PROC_TASK_1"]
    }
  ]
}