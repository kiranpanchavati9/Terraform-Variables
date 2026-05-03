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

