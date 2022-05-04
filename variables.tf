variable "subnet_id" {
        type = list(string)
        default = [
	  "metion-subnet-1",
	  "metion-subnet-2"
]
}

variable "vpc_security_group_ids" {
        type    = string

}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
