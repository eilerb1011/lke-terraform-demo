k8s_version = "1.26"
label = "us-east-k8s-2"
region = "us-east"
pools = {
  "pool-1" = {
    type = "g6-standard-1"
    min-nodes = 2
    max-nodes = 2
  }
}
