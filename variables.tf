variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-0aba19e56f3eaec05"
}

variable "instance_type" {
  description = "The instance type to use for the instance"
  type        = string
  default     = "t3.micro"
}