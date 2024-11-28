resource "aws_msk_cluster" "msk_snowflake" {
  cluster_name           = "msk_to_snowflake"
  kafka_version          = "3.2.0"
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type = "kafka.t3.small"
    client_subnets = [
      aws_subnet.subnet_az1.id,
      aws_subnet.subnet_az2.id,
      aws_subnet.subnet_az3.id,
    ] #
    storage_info {
      ebs_storage_info {
        volume_size = 10
      }
    }
    security_groups = [aws_security_group.sg.id] #
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn
  }

#   open_monitoring {
#     prometheus {
#       jmx_exporter {
#         enabled_in_broker = true
#       }
#       node_exporter {
#         enabled_in_broker = true
#       }
#     }
#   } #

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.msk_to_snowflake.name
      }
      firehose {
        enabled         = true
        delivery_stream = aws_kinesis_firehose_delivery_stream.test_stream.name
      } #
      s3 {
        enabled = true
        bucket  = aws_s3_bucket.bucket.id
        prefix  = "logs/msk-"
      } #
    }
  }

  tags = {
    project = "msk_to_snowflake"
  }
}