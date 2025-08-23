variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "ecommerce-vpc"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "The availability zones to use."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  description = "The private subnets to create."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "The public subnets to create."
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "ecommerce-cluster"
}

variable "db_name" {
  description = "The name of the RDS database."
  type        = string
  default     = "ecommercedb"
}

variable "db_username" {
  description = "The username for the RDS database."
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The password for the RDS database."
  type        = string
  sensitive   = true
}


