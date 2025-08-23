terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    "Terraform" = "true"
    "Environment" = "dev"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = var.cluster_name
  cluster_version = "1.23"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  eks_managed_node_groups = {
    one = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_type = "t3.medium"
    }
  }

  tags = {
    "Terraform" = "true"
    "Environment" = "dev"
  }
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.2.0"

  identifier = var.db_name

  engine            = "postgres"
  engine_version    = "13.7"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  vpc_security_group_ids = [module.eks.node_security_group_id]

  subnet_ids = module.vpc.private_subnets

  tags = {
    "Terraform" = "true"
    "Environment" = "dev"
  }
}


