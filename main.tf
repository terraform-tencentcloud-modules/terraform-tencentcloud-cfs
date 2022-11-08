provider "tencentcloud" {
  region = var.region
}

resource "tencentcloud_cfs_file_system" "cfs" {
  vpc_id            = var.vpc_id
  subnet_id         = var.cfs_subnet_id
  availability_zone = var.cfs_availability_zone

  name            = var.cfs_name
  storage_type    = "SD"
  access_group_id = tencentcloud_cfs_access_group.cfs-access-group.id
  protocol        = var.cfs_protocol

  tags = var.cfs_tags
}

resource "tencentcloud_cfs_access_group" "cfs-access-group" {
  name        = var.cfs_access_group_name
  description = var.cfs_access_group_description
}

resource "tencentcloud_cfs_access_rule" "cfs-access-rule" {
  count = length(var.auth_client_ip)

  access_group_id = tencentcloud_cfs_access_group.cfs-access-group.id
  auth_client_ip  = var.auth_client_ip[count.index]
  priority        = var.priority[count.index]
  rw_permission   = var.rw_permission[count.index]
  user_permission = var.user_permission[count.index]
}
