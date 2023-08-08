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