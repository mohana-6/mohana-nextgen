
aws_region             = "us-east-1"
name                   = "mosot"
cluster_id             = "arn:aws:ecs:us-east-1:269031123365:cluster/mohana-ecs-cluster"
cluster_name           = "mohana-ecs-cluster"
execution_role_arn     = "arn:aws:iam::269031123365:role/mohana-admin-role"
task_role_arn          = "arn:aws:iam::269031123365:role/mohana-admin-role"
#svc_account            = "arn:aws:secretsmanager:us-east-1:178445662108:secret:non-prod-gdap-artifactory-ybrklc"
vpc_id                 = "vpc-0437701bbfe96b9a9"
subnet_ids             = ["subnet-018a29d7fc5cf6401" , "subnet-09861fbc20853cc66"]
security_group_ids     = ["sg-0843384d70da85c46" , "sg-0baac50d3fac315bc"]
assign_public_ip       = true
bucket_name            = "mohana6-bucket"
container_image        = "269031123365.dkr.ecr.us-east-1.amazonaws.com/mohana:latest"
nginx_image = "269031123365.dkr.ecr.us-east-1.amazonaws.com/mohana:nginx"
target_group_arn       = "arn:aws:elasticloadbalancing:us-east-1:269031123365:targetgroup/vector-demo-tg/9e881ebec463093e"


min_capacity           = 1
max_capacity           = 5
cpu_target_value       = 85
scale_in_cooldown      = 300
scale_out_cooldown     = 300
service_count          =  1

#target_mount_point     = "/etc/vector/"
#source_mount_point     = "/data/vector"
#efs_id                 = "fs-067d95bb8f43202d8"

port_mappings = [
  {
    containerPort = 8686
    hostPort      = 8686
    protocol      = "tcp"
  }
]
task_cpu               = "2048"
task_memory            = "4096"
vector_version         = "0.39.0-alpine"
vector_log_level       = "info"
log_retention_days     = 30

# Environment variables
environment = {
  "VECTOR_LOG" = "debug"
  "RUST_BACKTRACE" = "full"
  "VECTOR_CONFIG_BUCKET_URL" = "s3://mohana6-bucket/vector_config/vector_mosot.yaml"
  "NGINX_CONFIG_BUCKET_URL" = "s3://mohana6-bucket/nginx_config/nginx_mosot.conf"
  "clk_val1"            = "arn:aws:secretsmanager:us-east-1:269031123365:secret:us-east-dev-corp-eb-clickhouse-username-HM13f7"
  "clk_val2"            = "arn:aws:secretsmanager:us-east-1:269031123365:secret:us-east-dev-corp-eb-clickhouse-password-8Os0R5" 

}

tags = {
  Environment = "dev"
  Project     = "Logging"
  version     = "0.39.0"
  product     = "mosot-1"
}
