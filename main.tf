resource "tencentcloud_cfs_file_system" "cfs" {
  for_each = var.cfs_map

  net_interface = try(each.value.net_interface, "VPC")
  vpc_id            = try(each.value.vpc_id, null)
  subnet_id         = try(each.value.subnet_id, null)
  availability_zone = each.value.availability_zone

  ccn_id = try(each.value.ccn_id, null)
  cidr_block = try(each.value.cidr_block, null)

  capacity = try(each.value.capacity, null)
  name            = try(each.value.cfs_name, each.key)
  storage_type    = try(each.value.storage_type, "SD")
  access_group_id = tencentcloud_cfs_access_group.cfs-access-group.id
  protocol        = try(each.value.protocol, "NFS")
  tags = try(each.value.tags, {})
  mount_ip = try(each.value.mount_ip, null)
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