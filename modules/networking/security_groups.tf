locals{
    inbound_ports = [22, 80, 443]
    outbound_ports = [0]
}

###Create Security Group
resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    description = "ec2 security group"
    vpc_id = aws_vpc.my_vpc.id

    dynamic "ingress" {
      for_each =  toset(local.inbound_ports)
      content {
        description = "Inbound from alb/internet"
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    tags = {
      Name = "ec2_sg"
    }
}
