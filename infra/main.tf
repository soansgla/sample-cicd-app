resource "aws_s3_bucket" "s3-bucket" {
  bucket = "sample-123450-devops-aodtest"
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_ecs_cluster" "foo" {
  name = "white-hart"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

resource "aws_secretsmanager_secret" "example" {
  name = "example"
}

resource "aws_db_instance" "default" {
  count                = 8
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.r6gd.16xlarge"
  name                 = "mydb"
  username             = "foo"
  password             = "test"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}