# terraform-eks-kubernetes

<img src="https://raw.githubusercontent.com/yassinemajidi/terraform-eks-kubernetes/main/Capture.JPG" width="400"/>

This is a sample project on how to create an EKS Cluster with two subnets using Terraform and test it using ready to use Kubernetes Hello world.

## I. Run with docker

  ```terminal|command=1|title=bash
  cd ./tf
  docker build -t terraform-eks:latest .
  ```

  ```terminal|command=1|title=bash
  docker run -e AWS_ACCESS_KEY_ID='your_access_key' -e AWS_SECRET_ACCESS_KEY='your_secret_key'  --name tf-container terraform-eks:latest
  ```

  Edit your AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY and run the container.

## II. Run localy

  ```terminal|command=1|title=bash
  aws configure
  ```
  Edit your AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
    

  ```terminal|command=1|title=bash
  cd ./tf
  terraform init
  terraform apply
  ```

## III. Test the cluster

  ```terminal|command=1|title=bash
  kubectl apply -f deployment.yaml
  ```  
  retrieve the name of the Pod
  ```terminal|command=1|title=bash
  kubectl get pods
  ```      
  ```terminal|command=1|title=bash
  kubectl port-forward <name-of-pod> 8080:8080
  ```  
  access the kubernetes hello world localy `http://localhost:8080`

    

    
