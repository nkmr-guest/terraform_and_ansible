variable "ami" {
  description = "The AMI to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "The type of the instance."
  type        = string
  default     = "t2.micro"
}

variable "tags" {
  description = "The tags to assign to the instance."
  type        = map(string)
  default     = {}
}

variable "key_name" {
  description = "The key name to use for the instance."
  type        = string
}

variable "sg_id" {
  type   = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched."
  type        = string
}
