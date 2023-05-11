token = ""
k8s_version = "1.26"
label = $region-"k8s"
region = "us-east"
pools = {
  "pool-1" = {
    type = "g6-standard-1"
    quantity = 2
  }
}
