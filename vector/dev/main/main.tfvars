aws_region             = "us-east-1"
name                   = "main"
cluster_id             = "arn:aws:ecs:us-east-1:269031123365:cluster/mohana-ecs-cluster"
cluster_name           = "mohana-ecs-cluster"
execution_role_arn     = "arn:aws:iam::269031123365:role/mohana-admin-role"
task_role_arn          = "arn:aws:iam::269031123365:role/mohana-admin-role"
#svc_account            = "arn:aws:secretsmanager:us-east-1:178445662108:secret:non-prod-gdap-artifactory-ybrklc"
vpc_id                 = "vpc-0437701bbfe96b9a9"
subnet_ids             = ["subnet-07adaeb561618127e" , "subnet-03a9ba72e44d58bd2"]
security_group_ids     = ["sg-0843384d70da85c46" , "sg-0baac50d3fac315bc"]
assign_public_ip       = true
bucket_name            = "mohana6-bucket"
container_image        = "269031123365.dkr.ecr.us-east-1.amazonaws.com/mohana:vector_nginx"
#nginx_image = "269031123365.dkr.ecr.us-east-1.amazonaws.com/mohana:nginx"
target_group_arn       = "arn:aws:elasticloadbalancing:us-east-1:269031123365:targetgroup/vector-tg/e282a74b31eb1e61"

# Autoscaling Configuration
min_capacity       = 1
max_capacity       = 1
cpu_target_value   = 85
scale_in_cooldown  = 300
scale_out_cooldown = 300
service_count      = 1

port_mappings = [
  {
    containerPort = 8686
    hostPort      = 8686
    protocol      = "tcp"
  },
  {
    containerPort = 9095
    hostPort      = 9095
    protocol      = "tcp"
  },
  {
    containerPort = 9092
    hostPort      = 9092
    protocol      = "tcp"
  },
  {
    containerPort = 80
    hostPort      = 80
    protocol      = "tcp"
  }

]
task_cpu               = "1024"
task_memory            = "2048"
vector_version         = "0.39.0-alpine"
vector_log_level       = "info"
log_retention_days     = 30

# Environment variables
environment = {
  "VECTOR_LOG" = "debug"
  "RUST_BACKTRACE" = "full"
  "VECTOR_CONFIG_BUCKET_URL" = "s3://us-east-dev-us-gdap-errorbudget/vector_config/vector.yaml"
  "NGINX_CONFIG_BUCKET_URL"  = "s3://us-east-dev-us-gdap-errorbudget/nginx_config/nginx_main.conf"
}

tags = {
  Environment = "dev"
  Project     = "Logging"
  version     = "0.39.0"
}