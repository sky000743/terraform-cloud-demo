   #Create ASG with Remote state and Pull Subnet information

data "terraform_remote_state" "vpc" { 
  backend = "remote"

  config = {
    organization = "sky000743"
    workspaces = {
      name = "vpc"
    }
  }
}

# Finds Ubuntu AMI for the Asg
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}