aws_region             = "us-east-1"
name                   = "main"
cluster_id             = "arn:aws:ecs:us-east-1:178445662108:cluster/us-east-dev-corp-gdap-cluster-fargate-eb-daap"
cluster_name           = "us-east-dev-corp-gdap-cluster-fargate-eb-daap"
execution_role_arn     = "arn:aws:iam::178445662108:role/US-EAST-DEV-CORP-GDAP-ERRORBUDGET-ECS-ROLE"
task_role_arn          = "arn:aws:iam::178445662108:role/US-EAST-DEV-CORP-GDAP-ERRORBUDGET-ECS-ROLE"
svc_account            = "arn:aws:secretsmanager:us-east-1:178445662108:secret:non-prod-gdap-artifactory-ybrklc"
vpc_id                 = "vpc-0597cf04f728274b1"
subnet_ids             = ["subnet-0e0f110e147710103" , "subnet-0c6bc6e35e3985c60" , "subnet-09c8ef9219d0de26d" , "subnet-095987d6f7f35c297"]
security_group_ids     = ["sg-0120962c581cb9218" , "sg-0e1381e16650612b7" , "sg-080870fde686d272a"]
assign_public_ip       = false
bucket_name            = "us-east-dev-us-gdap-errorbudget"
container_image        = "mcd.jfrog.io/gdap-docker-dev/dret/vector:0.39.0-alpine"

# Autoscaling Configuration
min_capacity       = 1
max_capacity       = 5
cpu_target_value   = 85
scale_in_cooldown  = 300
scale_out_cooldown = 300
service_count      =  1


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
  
}

tags = {
  Environment = "dev"
  Project     = "Logging"
  version     = "0.39.0"
}