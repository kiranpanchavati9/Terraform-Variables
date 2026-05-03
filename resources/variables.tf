variable "type" {
  default = "t3.small"
}

variable "ami" {
  default = "ami-076d128fb049922d4"
}

variable "components" {
  default = [
    "splunk-heavy-forwarder",
    "splunk-indexer",
    "splunk-searchhead"]
}

variable "ports" {
  default = [
    "9997",
    "8089",
    "8000",
    "8088",
    "443",
    "8080"]
}

variable "cidripv4" {
  default = "0.0.0.0/0"
}

variable "protocol" {
  default = "tcp"
}

variable "vpcid" {
  default = "vpc-03106aa780f4a0053"
}



