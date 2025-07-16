aws_region             = "us-east-1"
name                   = "mosot"
cluster_id             = "arn:aws:ecs:us-east-1:269031123365:cluster/mohana-ecs-cluster"
cluster_name           = "mohana-ecs-cluster"
execution_role_arn     = "arn:aws:iam::269031123365:role/mohana-admin-role"
task_role_arn          = "arn:aws:iam::269031123365:role/mohana-admin-role"
#svc_account            = "arn:aws:secretsmanager:us-east-1:178445662108:secret:non-prod-gdap-artifactory-ybrklc"
vpc_id                 = "vpc-0437701bbfe96b9a9"
subnet_ids             = ["subnet-09861fbc20853cc66" , "subnet-018a29d7fc5cf6401"]
security_group_ids     = ["sg-0843384d70da85c46" , "sg-0baac50d3fac315bc"]
assign_public_ip       = false
bucket_name            = "mohana6-bucket"
container_image        = "269031123365.dkr.ecr.us-east-1.amazonaws.com/mohana:vector_nginx"
#nginx_image = "269031123365.dkr.ecr.us-east-1.amazonaws.com/mohana:nginx"
target_group_arn       = "arn:aws:elasticloadbalancing:us-east-1:269031123365:targetgroup/vector-mosot-target/f25862d87da2836d"
min_capacity           = 0
max_capacity           = 0
cpu_target_value       = 85
scale_in_cooldown      = 300
scale_out_cooldown     = 300
service_count          = 0

port_mappings = [
  {
    containerPort = 8686
    hostPort      = 8686
    protocol      = "tcp"
  },
   {
    containerPort = 80
    hostPort      = 80
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
  "clk_val1"            = "iamusername"
  "clk_val2"            = "iamsecretpassword" 

}

tags = {
  Environment = "dev"
  Project     = "Logging"
  version     = "0.39.0"
  product     = "mosot-1"
}