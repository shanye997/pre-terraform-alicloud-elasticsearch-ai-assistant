# ------------------------------------------------------------------------------
# Complete Example for Elasticsearch AI Assistant Module
#
# This example demonstrates the basic usage of the elasticsearch-ai-assistant module.
# It creates a complete Elasticsearch cluster with VPC, VSwitch, and all necessary resources.
# ------------------------------------------------------------------------------

# Configure Alibaba Cloud Provider
provider "alicloud" {
  region = var.region
}

# Get available Elasticsearch zones
data "alicloud_elasticsearch_zones" "zones" {}

# Get current public IP for Kibana whitelist (optional)
data "http" "current_ip" {
  url = "https://ipinfo.io/ip"
}

# Call the elasticsearch-ai-assistant module
module "elasticsearch_ai_assistant" {
  source = "../../"

  # Common configuration
  common_config = {
    tags = {
      Environment = "example"
      Project     = "elasticsearch-ai-assistant"
      ManagedBy   = "terraform"
    }
  }

  # VPC configuration
  vpc_config = {
    cidr_block = var.vpc_cidr_block
    vpc_name   = "${var.name_prefix}-vpc"
  }

  # VSwitch configuration
  vswitch_config = {
    cidr_block   = var.vswitch_cidr_block
    zone_id      = var.availability_zone != null ? var.availability_zone : data.alicloud_elasticsearch_zones.zones.zones[0].id
    vswitch_name = "${var.name_prefix}-vswitch"
  }

  # Elasticsearch configuration
  elasticsearch_config = {
    password         = var.elasticsearch_password
    kibana_whitelist = var.kibana_whitelist != null ? var.kibana_whitelist : [format("%s/32", trimspace(data.http.current_ip.response_body))]
    version          = var.elasticsearch_version
    data_node_amount = var.data_node_amount
    data_node_spec   = var.data_node_spec
    kibana_node_spec = var.kibana_node_spec
    description      = "${var.name_prefix}-instance"
  }
}