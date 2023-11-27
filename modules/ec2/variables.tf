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

variable "public_subnet_id" {
  description = "The key name to use for the instance."
  type        = string
}

variable "vpc_id" {
  description = "The key name to use for the instance."
  type        = string
}

variable "sg_id" {
  description = "The key name to use for the instance."
  type        = string
}
