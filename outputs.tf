output "cfs_ids" {
  value = { for cfs_name, cfs in tencentcloud_cfs_file_system.cfs: cfs_name => cfs.id }
}

output "cfs_ips" {
  value = { for cfs_name, cfs in tencentcloud_cfs_file_system.cfs: cfs_name => cfs.mount_ip }
}
