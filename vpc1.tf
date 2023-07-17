resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc-1-subnet" {
  name                     = var.vpc_1_subnet_name
  region                   = var.vpc_1_subnet_region
  ip_cidr_range            = var.vpc_1_subnet_cidr
  network                  = google_compute_network.vpc.self_link
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "vpc-1-pods"
    ip_cidr_range = var.vpc_1_pods_cidr
  }
  secondary_ip_range {
    range_name    = "vpc-1-services"
    ip_cidr_range = var.vpc_1_services_cidr
  }
}

resource "google_compute_firewall" "icmp-rule" {
  name          = var.icmp_firewall_name
  network       = google_compute_network.vpc.self_link
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "internal-traffic" {
  name          = var.internal_firewall_name
  network       = google_compute_network.vpc.self_link
  source_ranges = [google_compute_subnetwork.vpc-1-subnet.ip_cidr_range, google_compute_subnetwork.vpc-2-subnet.ip_cidr_range]
  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["1-65535"]
  }
  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "iap" {
  name          = var.iap_firewall_name
  network       = google_compute_network.vpc.self_link
  source_ranges = ["35.235.240.0/20"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "mci" {
  name          = "cymbal-mci-lb-traffic"
  network       = google_compute_network.vpc.self_link
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_shared_vpc_host_project" "host" {
  project = var.host_project_id
}
resource "google_compute_shared_vpc_service_project" "name" {
  host_project    = var.host_project_id
  service_project = var.services_project_id
}