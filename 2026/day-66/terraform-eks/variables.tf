variable "region" {
  description = "The AWS region to create resources in."
  type        = string

}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string

}

variable "cluster_version" {

  description = "The Kubernetes version for the EKS cluster."
  type        = string


}

variable "node_instance_type" {
  description = "The instance type for the EKS worker nodes."
  type        = string


}

variable "node_desired_count" {

  description = "The desired number of worker nodes in the EKS cluster."
  type        = number


}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string


}