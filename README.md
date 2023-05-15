# LKE + Terraform Demo

This demo uses Terraform to spin up infrastructure on Linode and deploy an East and West Kubernetes cluster using Linode Kubernetes Engine (LKE).

## Prerequisites
Before starting this demo, you should have the following:

- Linode account
- Linode Personal Access Token (PAT) with the following scopes: linodes:read_write, lke:read_write
- A Gitlab account - either Gitlab.com or Gitlab CE will do:
-   For Gitlab CE, you will need access to a docker runner.
-   You will also need to create a personal access token in Github.

## SetUp
1. Import this repository to a new Gitlab Project:

```
Click New Project and select Import
```

2. Edit terraform.tfvars file and add you own values in (Do not replace the token value):
```
k8s_version = "<K8S-VERSION>"
label = "<CLUSTER-LABEL>"
region = "<CLUSTER-REGION>"
pools = {
  "pool-1" = {
    type = "<POOL-TYPE>"
    count = <POOL-COUNT>
  }
}
```
3.  Create an environment variable in Gitlab under Settings --> CICD --> Variables
```
-variable name = TF_VAR_token
-enter your Linode personal access token as the value
```
4.  Assign a docker runner to the project in Gitlab under Settings --> CICD --> Runners

5. Initialize the Terraform providers:
```
terraform init
```

5. Create the infrastructure:
```
terraform plan
terraform apply
```

6. After the infrastructure is created, navigate to the k8s directory:
```
cd ../k8s
```

7. Initialize the Terraform providers:
```
terraform init
```

8. Deploy Kubernetes environment:
```
terraform plan
terraform apply
```

9. After the environment is deployed, you can access the Nginx service at the IP address of the load balancer, which can be found in the Terraform output:
```
terraform output -raw api_endpoints
```


## Important Notes

- You will need a Linode account and an API token to use this demo.
- The Terraform configurations provided in this demo are for demonstration purposes only and are not production-ready. It is recommended that you review and modify the configurations to meet your specific requirements before using them in a production environment.
- The demo uses a null_resource with a local-exec provisioner to write the kubeconfig to a file. This is not recommended for production use, and it is recommended that you use a more secure method to manage your kubeconfig.
- This demo assumes that you have already installed and configured Terraform on your local machine. If you have not done so, please refer to the Terraform documentation for instructions.
