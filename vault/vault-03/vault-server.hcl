ui = "true"
log_level="INFO"
api_addr = "http://172.19.12.12:8200"
cluster_addr = "http://172.19.12.12:8201"

listener "tcp" {
  tls_disable = 1
  address = "172.19.12.12:8200"
  cluster_address = "172.19.12.12:8201"
}

storage "raft" {
  path = "/vault/data"

  retry_join {
    leader_api_addr = "http://172.19.12.10:8200"
  }
  retry_join {
    leader_api_addr = "http://172.19.12.11:8200"
  }
  retry_join {
    leader_api_addr = "http://172.19.12.12:8200"
  }

  autopilot {
    cleanup_dead_servers = "true"
    last_contact_threshold = "200ms"
    last_contact_failure_threshold = "10m"
    max_trailing_logs = 250000
    min_quorum = 3
    server_stabilization_time = "10s"
  }
}
