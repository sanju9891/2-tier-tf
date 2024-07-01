###Create the Networking module for VPC and Subnets
module "networking" {
    source = "./modules/networking"
    my_vpc_cidr = "10.0.0.0/16"
    vpc_tag = "my_vpc"
    az_1    = "us-east-1a"
    az_2    = "us-east-1b"
    public_subnet_1_cidr = "10.0.1.0/24"
    public_subnet_2_cidr = "10.0.2.0/24"
    private_subnet_1_cidr   = "10.0.3.0/24"
    private_subnet_2_cidr   = "10.0.4.0/24"
    ec2_security_group_id = module.networking.ec2_sg_id
}
### Create the IAM module for EC2 Instance profile

module "iam_role" {
    source = "./modules/iam_role"
}

module "ssm_parameter_store" {
    source = "./modules/ssm_parameter_store"
    mysql_db_pwd = var.mysql_db_password
    aws_secret_key = var.secret_key
}

### Create the Database module for RDS Mysql database

