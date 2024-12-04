provider "aws" {
  region  = "us-east-2"
}
# Define key pair resource

resource "aws_key_pair" "my_key_pair" {
  key_name   = "mykeypair"            
  public_key = file("/root/examples/id_rsa.pub") 
}

resource "aws_instance" "example_server" {
  ami           = "ami-00cda30cf72311684"
  instance_type = "t2.micro"
  key_name        = aws_key_pair.my_key_pair.key_name
  tags = {
    Name = "instance01"
  }
}

