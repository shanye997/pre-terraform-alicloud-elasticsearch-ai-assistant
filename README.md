Alibaba Cloud Elasticsearch AI Assistant Terraform Module

================================================ 

# terraform-alicloud-elasticsearch-ai-assistant

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-elasticsearch-ai-assistant/blob/main/README-CN.md)

Terraform module which creates Elasticsearch AI Assistant infrastructure on Alibaba Cloud. This module implements the solution for [Elasticsearch AI Assistant for intelligent O&M](https://www.aliyun.com/solution/tech-solution/elasticsearch-ai-assistant), which involves the creation and deployment of resources such as Virtual Private Cloud (VPC), Virtual Switch (VSwitch), and Alibaba Cloud Elasticsearch instance. The module provides a complete infrastructure setup for intelligent operations and maintenance using Elasticsearch and Kibana.

## Usage

This module creates a complete Elasticsearch AI Assistant infrastructure including VPC, VSwitch, and Elasticsearch instance with Kibana. It's designed for intelligent operations and maintenance scenarios.

```terraform
module "elasticsearch_ai_assistant" {
  source = "alibabacloud-automation/elasticsearch-ai-assistant/alicloud"

  # Common configuration
  common_config = {
    name_prefix = "my-es-ai-assistant"
    tags = {
      Environment = "production"
      Project     = "ai-assistant"
    }
  }

  # VPC configuration
  vpc_config = {
    cidr_block = "192.168.0.0/16"
  }

  # VSwitch configuration
  vswitch_config = {
    cidr_block = "192.168.1.0/24"
  }

  # Elasticsearch configuration
  elasticsearch_config = {
    password         = "YourSecurePassword123!"
    kibana_whitelist = ["192.168.1.100/32", "10.0.0.0/8"]
    version          = "8.17.0_with_X-Pack"
    data_node_amount = "2"
    data_node_spec   = "elasticsearch.sn1ne.large.new"
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-elasticsearch-ai-assistant/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
<!-- Terraform docs will be automatically generated here -->
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)