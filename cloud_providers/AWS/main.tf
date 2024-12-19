# AMI
data "aws_ami" "amazonlinux2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = "amazon"
}

# EC2
resource "aws_instance" "myinstance" {
  count = 3
  ami = data.aws_ami.amazonlinux2.id
  instance_type = "t2.micro"

  tags = {
    Name = "myvm-${count.index + 1}"
  }
}
