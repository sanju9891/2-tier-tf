### Create IAM Role to access RDS and SSM parameter store
resource "aws_iam_role" "ec2_role" {
    name = "ec2_rds_ssm_role"
}

### Terraform's jsonencode function converts
### Terraform expression result to valid JSON syntax

assume_role_policy = jsonencode ({
    version = "2012-10-17"
    Statement = [
        {
            Action = "sts.AssumeRole"
            Effect = "Allow"
            Sid = ""
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        }
    ]
})