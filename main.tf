provider "google" {
  project = var.project_id
  region  = var.region
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!@#$%^&*"
}

resource "google_sql_database_instance" "instance" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.tier

    ip_configuration {
      ssl_mode = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
      authorized_networks {
        value = "0.0.0.0/0"
      }
    }

    backup_configuration {
      enabled = true
    }

    availability_type = "ZONAL"
  }

  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "user" {
  name     = var.database_user
  instance = google_sql_database_instance.instance.name
  password = random_password.db_password.result
}
