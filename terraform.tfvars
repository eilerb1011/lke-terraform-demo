k8s_version = "1.26"
label = $region-"k8s"
region = "us-east"
#Mark the following true or false for HA control plane
control = "true"
pools = {
  "pool-1" = {
    type = "g6-standard-1"
    min-nodes = 2
    max-nodes = 2
  }
}
