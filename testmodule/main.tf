terraform {
 cloud {
 organization = "Pirates of the Carribean"
 workspaces {
 name = "The-High-Seas-Workspace"
 }
 }
 required_providers {
 aws = {
 source = "hashicorp/aws"
 version = "~> 4.4.0"
 }
}
required_version = ">= 1.1.0"
}
provider "aws" {
region = "us-east-2"
default_tags {
 tags = {
 hashicorp-learn = "module-use"
 }
 }
}
resource "docker_container" "nginx" {
 image = docker_image.nginx.latest
 name = "tutorial"
 ports {
 internal = 80
 external = 8000
 }
}
module "vpc" {
source = "terraform-aws-modules/vpc/aws"
version = "3.14.0"
name = var.vpc_name
cidr = var.vpc_cidr
azs = var.vpc_azs
private_subnets = var.vpc_private_subnets
public_subnets = var.vpc_public_subnets
enable_nat_gateway = var.vpc_enable_nat_gateway
tags = var.vpc_tags
}
