# LKE + Terraform Demo

This demo uses Terraform and Gitlab to instantiate infrastructure on Linode and deploy an East and West Kubernetes cluster using Linode Kubernetes Engine (LKE).

## Prerequisites
Before starting this demo, you should have the following:

- Linode account
- Linode Personal Access Token (PAT) with the following scopes: linodes:read_write, lke:read_write
- A Gitlab account - either Gitlab.com or Gitlab CE will do:
-   For Gitlab CE, you will need access to a docker runner.
-   You will also need to create a personal access token in Github.

## SetUp
1. Import this repository to a new Gitlab Project:
-Click New Project and select Import
```
2. Edit terraform.tfvars file and add your own values to the file.
-If you only want one cluster. delete everything starting with the CLUSTER 2 Settings line
-HA Value determines whether the control plane has 1 node or 3.  And HA control plane can not be reverted.  However a non-HA control plane can be upgraded later.
-Select you Linode instance types used in the node pool:  Values can be found using the API:  curl https://api.linode.com/v4/linode/types | jq
-Set your minimum and maximum nodes for auto-scaling.
k8s_version = "1.26"
#####CLUSTER 1 Settings###############
label = "us-east-k8s-2"
region = "us-east"
#Mark the following true for HA control plane or false for non-HA
HA = false
pools = {
  "pool-1" = {
    type = "g6-standard-1"
    min-nodes = 2
    max-nodes = 2
  }
}
############CLUSTER 2 Settings###########
label2 = "us-west-k8s-2"
region2 = "us-west"
#Mark the following true for HA control plane or false for non-HA
HA2 = false
pools2 = {
  "pool-2" = {
    type2 = "g6-standard-1"
    min-nodes2 = 1
    max-nodes2 = 3
  }
}
```
3.  Create an environment variable in Gitlab under Settings --> CICD --> Variables
```
-variable name = TF_VAR_token
-enter your Linode personal access token as the value
```
4.  Assign a docker runner to the project in Gitlab under Settings --> CICD --> Runners
```
5. Validate Pipeline is functioning by viewing CICD --> Pipelines:
```
6. Create the infrastructure:
```
If all phases are passing, you can manually deploy or comment out the following lines from .gitlab-ci.yml to have deployments fully automated
-**WARNING** Terraform can be destructive and this action could result in infrastructure being unintentionally destroyed.
