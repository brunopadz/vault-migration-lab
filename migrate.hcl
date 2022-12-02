storage_source "raft" {
  path    = "/vault/data"
  node_id = "vault-01"
}

storage_destination "dynamodb" {
  ha_enabled = "true"
  region     = "us-east-1"
  table      = "vault"

  # Should be replaced by IAM roles
#  access_key = ""
#  secret_key = ""
}

cluster_addr = "http://172.19.12.10:8201"
