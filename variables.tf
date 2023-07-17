variable "host_project_id" {
  type = string
}
variable "services_project_id" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "vpc_1_subnet_name" {
  type = string
}
variable "vpc_1_subnet_region" {
  type = string
}
variable "vpc_1_subnet_cidr" {
  type = string
}
variable "vpc_1_pods_cidr" {
  type = string
}
variable "vpc_1_services_cidr" {
  type = string
}
variable "vpc_2_subnet_name" {
  type = string
}
variable "vpc_2_subnet_region" {
  type = string
}
variable "vpc_2_subnet_cidr" {
  type = string
}
variable "vpc_2_pods_cidr" {
  type = string
}
variable "vpc_2_services_cidr" {
  type = string
}
variable "gke_cluster_1_name" {
  type = string
}
variable "gke_cluster_1_location" {
  type = string
}
variable "gke_cluster_2_name" {
  type = string
}
variable "gke_cluster_2_location" {
  type = string
}
variable "icmp_firewall_name" {
  type = string
}
variable "private_traffic_firewall_name" {
  type = string
}
variable "iap_firewall_name" {
  type = string
}
variable "host_project_number" {
  type = string
}
variable "gke_sa_name" {
  type    = string
  default = "cymbal-gke-sa"
}
variable "gke_cluster_1_cidr" {
  type    = string
  default = "172.16.0.0/28"
}
variable "gke_cluster_2_cidr" {
  type    = string
  default = "172.17.0.0/28"
}

variable "gke_node_machine_type" {
  type    = string
  default = "e2-standard-4"
}