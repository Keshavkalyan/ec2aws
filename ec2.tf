resource "aws_instance" "web" {
  ami           = "ami-0b32d400456908bf9"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.snphello24082024.name]
  key_name = aws_key_pair.key_pair.key_name

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "snphello24082024" {
  name        = "security group using snphello24082024"
  description = "security group using snphello24082024"
  vpc_id      = "vpc-05bd8c020e2c1266f"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }

    ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "RDP"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "snphello24082024"
  }
}