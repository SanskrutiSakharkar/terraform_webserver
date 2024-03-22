terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}


resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "http_server_sg" {
  name   = "http_server_sg"
  vpc_id = "vpc-0ac57ed01e1ad8529"


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "http_server_sg"
  }
}

resource "aws_instance" "http_server" {
  ami                    = "ami-05295b6e6c790593e"
  key_name               = "mumbai-windows-keypair"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-01ce5098e3757445b"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]


  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo usermod -a -G apache ec2-user",
      "sudo chmod 777 /var/www/html",
      "cd /var/www/html",
      "echo Welcome to Webserver ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }
}
