resource "google_compute_router" "router-1" {
  name    = var.router_1_name
  network = google_compute_network.vpc.self_link
  region  = var.vpc_1_subnet_region
}
resource "google_compute_router_nat" "nat-1" {
  name                               = var.router_1_name
  router                             = google_compute_router.router-1.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  region                             = var.vpc_1_subnet_region
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
resource "google_compute_router" "router-2" {
  name    = var.router_2_name
  network = google_compute_network.vpc.self_link
  region  = var.vpc_2_subnet_region
}
resource "google_compute_router_nat" "nat-2" {
  name                               = var.router_2_name
  router                             = google_compute_router.router-2.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  region                             = var.vpc_2_subnet_region
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
variable "router_1_name" {
  type = string
}
variable "router_2_name" {
  type = string
}