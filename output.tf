output "zookeeper_connect_string" {
  value = aws_msk_cluster.msk_snowflake.zookeeper_connect_string
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.msk_snowflake.bootstrap_brokers_tls
}