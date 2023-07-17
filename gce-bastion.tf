# Define the Google Cloud Platform (GCP) instances for bastion hosts
resource "google_compute_instance" "bastion_host_1" {
  name         = "bastion-host-1"
  machine_type = "e2-medium"
  zone         = "Bastion Host 1 Zone" # Change this to the zone where Subnet 1 is located
  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20220110" # Change this to your desired image
    }
  }
  network_interface {
    network = "Network Name" # Change this to the desired network name
  }
  service_account {
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }
}

resource "google_compute_instance" "bastion_host_2" {
  name         = "bastion-host-2"
  machine_type = "e2-medium"
  zone         = "Bastion Host 2 Zone" # Change this to the zone where Subnet 2 is located
  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20220110" # Change this to your desired image
    }
  }
  network_interface {
    network = "Network Name" # Change this to the desired network name
  }
  service_account {
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }
}