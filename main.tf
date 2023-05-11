terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.1"
    }
  }
}
//Use the Linode Provider
provider "linode" {
  token = var.token
}

//Use the linode_lke_cluster resource to create
//a Kubernetes cluster
resource "linode_lke_cluster" "CBC" {
  k8s_version = var.k8s_version
  label       = var.label
  region      = var.region
  control_plane  {
        high_availability = var.HA
    }
  dynamic "pool" {
    for_each = var.pools
    content {
      type  = pool.value["type"]
      count = pool.value["min-nodes"]
      autoscaler {
        min = pool.value["min-nodes"]
        max = pool.value["max-nodes"]
        }
      }
    }
  }

terraform {
  backend "http" {
  }
}
