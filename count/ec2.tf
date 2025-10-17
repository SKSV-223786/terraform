resource "aws_instance" "Frontend" {
    ami = "ami-09c813fb71547fc4f"
    count = 2
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    tags = {
        Name = var.instances [count.index]
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
  name   = "allow_all"

  egress {
    from_port       = 0 ## All Ports ##
    to_port         = 0  
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]      #internet
  }

  ingress {
    from_port       = 0   ## All Ports ##
    to_port         = 0
    protocol        = "-1" # All Protoclos #
    cidr_blocks     =   ["0.0.0.0/0"]  #internet
  }
  tags = {
    Name= "allow_all"
  }
}