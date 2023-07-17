resource "google_container_cluster" "gke-2" {
  project  = var.services_project_id
  name     = var.gke_cluster_2_name
  location = var.vpc_2_subnet_region

  network         = google_compute_network.vpc.self_link
  subnetwork      = google_compute_subnetwork.vpc-2-subnet.self_link
  networking_mode = "VPC_NATIVE"
  release_channel {
    channel = "STABLE"
  }
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.gke_cluster_2_cidr

  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "0.0.0.0/0"
      display_name = "GKE-2 CIDR"
    }
  }

  initial_node_count = 1
  workload_identity_config {
    workload_pool = "${var.services_project_id}.svc.id.goog"
  }
  node_config {
    machine_type = var.gke_node_machine_type
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = "vpc-2-pods"
    services_secondary_range_name = "vpc-2-services"
  }
}