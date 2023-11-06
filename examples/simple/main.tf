provider "tencentcloud" {
  region = "ap-shanghai"
}

module "cfs" {
  source = "../.."
  cfs_map = {
    "test_cfs_1" = {
      availability_zone = "ap-shanghai-4"
      vpc_id            = "vpc-rtkna1ai"
      subnet_id         = "subnet-pb3ujj6l"
      protocol          = "NFS"
      cfs_tags = {
        owner = "multi-cloud"
      }
    },
    "test_cfs_2" = {
      availability_zone = "ap-shanghai-4"
      vpc_id            = "vpc-rtkna1ai"
      subnet_id         = "subnet-pb3ujj6l"
      protocol          = "NFS"
      cfs_tags = {
        owner = "multi-cloud"
      }
    }
  }

  cfs_access_group_name = "test_cfs_access_group"
  auth_client_ip        = ["10.0.0.0/16", "192.168.0.0/24"]    // A single IP or a single IP address range such as 10.1.10.11 or 10.10.1.0/24 indicates that all IPs are allowed. Please note that the IP entered should be CVM's private IP.
  priority              = [1, 1]                               // The priority level of rule. Valid value ranges: (1~100). 1 indicates the highest priority.
  rw_permission         = ["RO", "RO"]                         //  Read and write permissions. Valid values are RO and RW. and default is RO.
  user_permission       = ["no_root_squash", "no_root_squash"] // The permissions of accessing users. Valid values are all_squash, no_all_squash, root_squash and no_root_squash. and default is root_squash. all_squash indicates that all access users are mapped as anonymous users or user groups; no_all_squash indicates that access users will match local users first and be mapped to anonymous users or user groups after matching failed; root_squash indicates that map access root users to anonymous users or user groups; no_root_squash indicates that access root users keep root account permission.
}
