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


resource "aws_instance" "test" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 in us-west-2
  instance_type = "t3.micro"               # Free Tier
  
  tags = {
    Test = "FreeTierTest"
  }
}

output "message" {
  value = "If this works, Free Tier is active"
}
