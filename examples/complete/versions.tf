terraform {
  required_version = ">= 1.0"

  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
    }
    http = {
      source = "hashicorp/http"
    }
  }
}