resource "google_compute_instance" "vm_instance" {
  name         = "vm"
  machine_type = "e2-small"
  zone         = "europe-west3-c"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.management_subnet.id
  }
}
  ##service_account {
    #email  = google_service_account.ec2-service-account.email
    #scopes = ["cloud-platform"]
  #}
