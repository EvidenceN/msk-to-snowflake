resource "aws_kinesis_firehose_delivery_stream" "msk_snowflake_destination" {
  name        = "msk-snowflake-destination"
  destination = "snowflake"

  snowflake_configuration {
    account_url = "https://example.snowflakecomputing.com"
    database    = "example-db"
    private_key = "..."
    role_arn    = aws_iam_role.firehose.arn
    schema      = "example-schema"
    table       = "example-table"
    user        = "example-usr"

    s3_configuration {
      role_arn           = aws_iam_role.firehose.arn
      bucket_arn         = aws_s3_bucket.bucket.arn
      buffering_size     = 10
      buffering_interval = 400
      compression_format = "GZIP"
    }
  }
}

# MSK Source Configuration
# Snowflake Destination Configuration