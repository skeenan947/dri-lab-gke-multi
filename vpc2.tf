
resource "google_compute_subnetwork" "vpc-2-subnet" {
  name                     = var.vpc_2_subnet_name
  region                   = var.vpc_2_subnet_region
  ip_cidr_range            = var.vpc_2_subnet_cidr
  network                  = google_compute_network.vpc.self_link
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "vpc-2-pods"
    ip_cidr_range = var.vpc_2_pods_cidr
  }
  secondary_ip_range {
    range_name    = "vpc-2-services"
    ip_cidr_range = var.vpc_2_services_cidr
  }
}