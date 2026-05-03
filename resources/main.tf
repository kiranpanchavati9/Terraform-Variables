resource "aws_instance" "splunk-components" {
  count = 3
  ami           = var.ami
  instance_type = var.type

  tags = {
    Name = var.components[count.index]
  }
}

resource "aws_security_group" "allow_splunk_firewall_rules" {
  name        = "allow_splunk_firewall"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = var.vpcid

  tags = {
    Name = "allow_splunk_firewall_ports"
  }
}

resource "aws_vpc_security_group_ingress_rule" "splunk" {
  for_each = toset(var.ports)

  security_group_id = aws_security_group.allow_splunk_firewall_rules.id
  cidr_ipv4         = var.cidripv4
  from_port         = tonumber(each.value)
  ip_protocol       = var.protocol
  to_port           = tonumber(each.value)
}


resource "aws_vpc_security_group_egress_rule" "splunk" {
  for_each = toset(var.ports)

  security_group_id = aws_security_group.allow_splunk_firewall_rules.id
  cidr_ipv4         = var.cidripv4
  from_port         = tonumber(each.value)
  ip_protocol       = var.protocol
  to_port           = tonumber(each.value)
}