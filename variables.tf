variable "region" {
  default = ""
}

variable "cfs_availability_zone" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "cfs_subnet_id" {
  default = ""
}

#cfs
variable "cfs_name" {
  default = ""
}

variable "cfs_protocol" {
  default = ""
}

variable "cfs_tags" {
  type    = map(string)
  default = {}
}

#Access Group
variable "cfs_access_group_name" {
  default = ""
}

variable "cfs_access_group_description" {
  default = ""
}

#Access Rule
variable "auth_client_ip" {
  type    = list(string)
  default = [""]
}

variable "priority" {
  type    = list(number)
  default = []
}

variable "rw_permission" {
  type    = list(string)
  default = [""]
}

variable "user_permission" {
  type    = list(string)
  default = [""]
}
