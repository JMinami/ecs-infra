resource "aws_ecs_cluster" "mydev-app" {
  name = "mydev-${var.env}"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "mydev-app" {
  cluster_name       = aws_ecs_cluster.mydev-app.name
  capacity_providers = ["FARGATE_SPOT"]
}
