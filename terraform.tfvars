k8s_version = "1.26"
label = "us-east-k8s-2"
region = "us-east"
#Change the below line to true for an HA control plane.  This is a one way chnage and the cluster must be destroyed to move back to non-HA
HA = false
pools = {
  "pool-1" = {
    type = "g6-standard-1"
    min-nodes = 2
    max-nodes = 2
  }
}
