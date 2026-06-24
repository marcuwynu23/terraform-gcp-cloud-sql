output "instance_name" {
  value       = google_sql_database_instance.instance.name
  description = "The name of the Cloud SQL instance."
}

output "connection_name" {
  value       = google_sql_database_instance.instance.connection_name
  description = "The connection name of the Cloud SQL instance."
}

output "public_ip_address" {
  value       = google_sql_database_instance.instance.public_ip_address
  description = "The public IP address of the Cloud SQL instance."
}

output "database_name" {
  value       = google_sql_database.database.name
  description = "The name of the initial database."
}

output "database_user" {
  value       = google_sql_user.user.name
  description = "The name of the initial database user."
}

output "database_password" {
  value       = random_password.db_password.result
  description = "The password of the initial database user. Sensitive data!"
  sensitive   = true
}
