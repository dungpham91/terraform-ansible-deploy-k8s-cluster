terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
}

# Change this part to your local settings
provider "aws" {
  region                    = var.region
  shared_config_files       = ["/home/dungpham/.aws/config"]
  shared_credentials_files  = ["/home/dungpham/.aws/credentials"]
  profile                   = "default"
}

locals {
  tags = {
    Name        = "${var.project}-${var.environment}-tfs3backend"
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_resourcegroups_group" "resourcegroups_group" {
  name = "${var.project}-${var.environment}-tfs3backend"

  resource_query {
    query = <<-JSON
      {
        "ResourceTypeFilters": [
          "AWS::AllSupported"
        ],
        "TagFilters": [
          {
            "Key": "project",
            "Values": ["${var.project}"]
          }
        ]
      }
    JSON
  }
}