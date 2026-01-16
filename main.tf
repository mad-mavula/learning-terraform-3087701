# data "aws_ami" "app_ami" {
#   most_recent = true
# 
#   filter {
#     name   = "name"
#     values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
#   }
# 
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# 
#   owners = ["979382823631"] # Bitnami
# }
# 
# resource "aws_instance" "web" {
#   ami           = data.aws_ami.app_ami.id
#   instance_type = "t2.micro"
# 
#   tags = {
#     Name = "HelloWorld"
#   }
# }

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical's ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"  # Free Tier

  tags = {
    Name = "HelloWorld"
  }
}
