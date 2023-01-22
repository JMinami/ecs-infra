locals {
  policy = <<EOF
  {
    "rules": [
      {
        "rulePriority": 1,
        "selection": {
          "tagStatus": "any",
          "countType": "imageCountMoreThan",
          "countNumber": 5
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
EOF
}

resource "aws_ecr_repository" "mydev-backend-1" {
  name                 = "mydev-backend-1"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "mydev-backend-1" {
  repository = aws_ecr_repository.mydev-backend-1.name
  policy     = local.policy
}

