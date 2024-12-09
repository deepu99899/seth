resource "aws_instance" "newinc" {
    instance_type = "t2.micro"
    ami = "ami-0614680123427b75e"
    subnet_id = aws_subnet.supersub.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id ]

  
}