resource "google_project_iam_member" "vpc_host_compute_engine_hostagentuser" {
  project = var.services_project_id
  role    = "roles/container.hostServiceAgentUser"
  member  = "serviceAccount:service-${var.host_project_number}@container-engine-robot.iam.gserviceaccount.com"
}
resource "google_project_iam_member" "vpc_host_compute_engine" {
  project = var.services_project_id
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:service-${var.host_project_number}@container-engine-robot.iam.gserviceaccount.com"
}
resource "google_project_iam_member" "vpc_host_compute_enginesecurityadmin" {
  project = var.services_project_id
  role    = "roles/compute.securityAdmin"
  member  = "serviceAccount:service-${var.host_project_number}@container-engine-robot.iam.gserviceaccount.com"
}
resource "google_project_iam_member" "vpc_host_project_user" {
  project = var.services_project_id
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${var.host_project_number}@cloudservices.gserviceaccount.com"
}
