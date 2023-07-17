resource "google_service_account" "gke_sa" {
  account_id   = var.gke_sa_name
  display_name = "gke sa"
  project      = data.google_project.services.project_id
}

resource "google_project_iam_member" "gke_logs" {
  project = data.google_project.services.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}
resource "google_project_iam_member" "gke_metrics" {
  project = data.google_project.services.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}
resource "google_project_iam_member" "gke_stackdriver" {
  project = data.google_project.services.project_id
  role    = "roles/stackdriver.resourceMetadata.writer"
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}
resource "google_project_iam_member" "gke_monitoring_viewer" {
  project = data.google_project.services.project_id
  role    = "roles/monitoring.viewer"
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}
resource "google_project_iam_member" "storage_object_viewer" {
  project = data.google_project.services.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}