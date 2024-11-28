resource "aws_msk_cluster" "msk_to_snowflake" {
    broker_node_group_info {
      client_subnets = [""  ]
      instance_type = ""
      security_groups = [""]

    }
    cluster_name = ""
    kafka_version = ""
    number_of_broker_nodes = ""
}