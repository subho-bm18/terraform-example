variable "stack_name" { default = "" }

variable "environment" { default = "" }

variable "domain_name" { default = "" }

variable "domain_name_servers" { default = "" }

variable "region" { default = "" }

variable "cidr" { default = "10.40.0.0/16" }

variable "internal_subnets" { default = [""] }

variable "external_subnets" { default = [""] }

variable "availability_zones" { default = [""] }

variable "deploy_instance_type" { default = "t2.micro" }

variable "zone_id" { default = "" }



variable "billing" {}

variable "component" {}

variable "account_number" {}

variable "tenant_mapping_proxy_folder" { default = "tenant_mapping_proxy" }

variable "tenant_mapping_dns_folder" { default = "tenant_mapping_dns" }

variable "device_mapping_folder" { default = "sit-log-aggregation/device-mapping-files" }


