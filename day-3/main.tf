resource "aws_vpc" "don" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "deepudon"


}
  
}
resource "aws_internet_gateway" "son" {
    vpc_id = aws_vpc.don.id

  
}
resource "aws_subnet" "supersub" {
    vpc_id = aws_vpc.don.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true




  
}
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.don.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.son.id
    
  }
  
}
#associate  RT to subnet
resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.supersub.id
    
  
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.don.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }
  
