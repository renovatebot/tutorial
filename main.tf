terraform {

  required_version = ">= 1.6.0"
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = ">= 0.7.0"
    }
    gsuite = {
      source  = "private-registry.gcp.asml.com/asml/gsuite"
      version = "~> 0.1.54"
    }
    gcpipam = {
      source  = "private-registry.gcp.asml.com/asml/gcpipam"
      version = "~> 0.3"
    }
    google = {
      version = ">= 6.0"
    }
    google-beta = {
      version = ">= 6.0"
    }
  }

}

provider "gcpipam" {
}

provider "google" {
  add_terraform_attribution_label = false
}

provider "google-beta" {
  add_terraform_attribution_label = false
}

provider "googleworkspace" {
}

# To run Terraform init from Cloud Shell use:
# terraform init -backend-config=prefix=$GOOGLE_CLOUD_PROJECT

module "asml_configuration" {
  source = "git::git@github.com:asml-gh/asml-terraform-modules.git//common/gcp/asml_configuration?ref=v3.5.4"
}