variable "ec2_config" {
  type = object({
    vpc_id           = string
    public_subnet_id = list(string)
    sg_id            = string
  })
}
