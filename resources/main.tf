resource "aws_instance" "splunk-components" {
  count = 3
  ami           = var.ami
  instance_type = var.type

  tags = {
    Name = var.components[count.index]
  }
}