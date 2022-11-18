resource "google_compute_subnetwork" "management_subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "europe-west3"
  network       = google_compute_network.vpc_network.id

}

resource "google_compute_subnetwork" "restricted_subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "europe-west3"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}