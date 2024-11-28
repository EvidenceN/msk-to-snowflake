# locals {
#   msk_source_configuration_role_arn = ""
#   msk_cluster_arn = aws_msk_cluster.msk_snowflake.arn
#   topic_name = ""
#   snowflake_account_url = ""
#   snowflake_database = ""
#   snowflake_private_key = ""
#   snowflake_role_arn = ""
#   snowflake_schema = ""
#   snowflake_table = ""
#   snowflake_user = ""
#   snowflake_firehose_role_arn = aws_iam_role.firehose.arn
#   s3_bucket_arn = aws_s3_bucket.bucket.arn
#   snowflake_s3_buffering_size = 10
#   snowflake_s3_buffering_interval = 400
#   snowflake_s3_compression_format = "GZIP"
# }

# resource "aws_kinesis_firehose_delivery_stream" "msk_snowflake_destination" {
#   name        = "msk-snowflake-destination"

#    msk_source_configuration {
#      authentication_configuration {
#        connectivity = "PRIVATE"
#        role_arn = local.msk_source_configuration_role_arn
#      }

#      msk_cluster_arn = local.msk_cluster_arn

#      topic_name = local.topic_name
#    }

#   destination = "snowflake"

#   snowflake_configuration {
#     account_url = local.snowflake_account_url
#     database    = local.snowflake_database
#     private_key = local.snowflake_private_key
#     role_arn    = aws_iam_role.firehose.arn
#     schema      = local.snowflake_schema
#     table       = local.snowflake_table
#     user        = local.snowflake_user

#     s3_configuration {
#       role_arn           = local.snowflake_firehose_role_arn
#       bucket_arn         = local.s3_bucket_arn
#       buffering_size     = local.snowflake_s3_buffering_size
#       buffering_interval = local.snowflake_s3_buffering_interval
#       compression_format = local.snowflake_s3_compression_format
#     }
#   }
# }





# Already Defined Somewhere Else -----------------------
# --------------------------------------------------------

# data "aws_iam_policy_document" "firehose_assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["firehose.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

# resource "aws_iam_role" "firehose_role" {
#   name               = "msk_snowflake_firehose_role"
#   assume_role_policy = data.aws_iam_policy_document.firehose_assume_role.json
# }



# Configure MSK first. 
# MSK Source Configuration
# Snowflake Destination Configuration