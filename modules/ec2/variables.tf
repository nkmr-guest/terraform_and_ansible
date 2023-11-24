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
  description = "The Security Group ID to use for the instance"
  type        = string
}

variable "ec2_sg" {
  type = object({
    vpc_id           = string
    sg_id            = string
  })
}
