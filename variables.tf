variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "region" {
  description = "The region in which to provision resources. To stay within GCP Free Tier, use: us-west1, us-central1, or us-east1."
  type        = string
  default     = "us-central1"

  validation {
    condition     = contains(["us-west1", "us-central1", "us-east1"], var.region)
    error_message = "Region must be one of the GCP Free Tier regions: us-west1, us-central1, or us-east1."
  }
}

variable "instance_name" {
  description = "The name of the Cloud SQL instance."
  type        = string
}

variable "database_name" {
  description = "The name of the initial database to create."
  type        = string
}

variable "database_user" {
  description = "The name of the initial database user to create."
  type        = string
}

variable "database_version" {
  description = "The database engine version. For free tier, use MYSQL_8_0 or POSTGRES_14/15."
  type        = string
  default     = "MYSQL_8_0"

  validation {
    condition     = contains(["MYSQL_8_0", "POSTGRES_14", "POSTGRES_15"], var.database_version)
    error_message = "Database version must be one of: MYSQL_8_0, POSTGRES_14, POSTGRES_15."
  }
}

variable "tier" {
  description = "The machine type to use. For free tier, use db-f1-micro."
  type        = string
  default     = "db-f1-micro"
}
