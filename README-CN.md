阿里云 Elasticsearch 智能运维 AI 助手 Terraform 模块

================================================ 

# terraform-alicloud-elasticsearch-ai-assistant

[English](https://github.com/alibabacloud-automation/terraform-alicloud-elasticsearch-ai-assistant/blob/main/README.md) | 简体中文

Terraform 模块，用于在阿里云上创建 Elasticsearch 智能运维 AI 助手基础设施。该模块实现了[Elasticsearch 智能运维 AI 助手](https://www.aliyun.com/solution/tech-solution/elasticsearch-ai-assistant)解决方案，涉及专有网络（VPC）、交换机（VSwitch）和阿里云 Elasticsearch 实例等资源的创建和部署。该模块为使用 Elasticsearch 和 Kibana 进行智能运维提供了完整的基础设施设置。

## 使用方法

该模块创建完整的 Elasticsearch 智能运维 AI 助手基础设施，包括 VPC、VSwitch 和带有 Kibana 的 Elasticsearch 实例。专为智能运维场景而设计。

```terraform
module "elasticsearch_ai_assistant" {
  source = "alibabacloud-automation/elasticsearch-ai-assistant/alicloud"

  # 通用配置
  common_config = {
    name_prefix = "my-es-ai-assistant"
    tags = {
      Environment = "production"
      Project     = "ai-assistant"
    }
  }

  # VPC 配置
  vpc_config = {
    cidr_block = "192.168.0.0/16"
  }

  # VSwitch 配置
  vswitch_config = {
    cidr_block = "192.168.1.0/24"
  }

  # Elasticsearch 配置
  elasticsearch_config = {
    password         = "YourSecurePassword123!"
    kibana_whitelist = ["192.168.1.100/32", "10.0.0.0/8"]
    version          = "8.17.0_with_X-Pack"
    data_node_amount = "2"
    data_node_spec   = "elasticsearch.sn1ne.large.new"
  }
}
```

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-elasticsearch-ai-assistant/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
<!-- Terraform 文档会自动生成在这里 -->
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)