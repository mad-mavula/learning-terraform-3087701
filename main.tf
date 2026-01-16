# Find Bitnami Tomcat AMI
data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

# Use t3.micro - Free Tier eligible
resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.micro"  # Free Tier

  tags = {
    Name = "BitnamiTomcat-FreeTier"
  }
}

output "free_tier_info" {
  value = "Using t3.micro - Free Tier eligible (750 hours/month free)"
}

output "bitnami_ami" {
  value = data.aws_ami.app_ami.id
}
