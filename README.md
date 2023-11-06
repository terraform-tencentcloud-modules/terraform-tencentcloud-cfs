# TencentCloud CFS Module for Terraform

A terraform module used for create TencentCloud CFS file storage.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 0.14.06 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >1.78.1 |

## Resources

| Name | Type |
|------|------|
| [tencentcloud_cfs_access_group.cfs-access-group](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/cfs_access_group) | resource |
| [tencentcloud_cfs_access_rule.cfs-access-rule](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/cfs_access_rule) | resource |
| [tencentcloud_cfs_file_system.cfs](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/cfs_file_system) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_client_ip"></a> [auth\_client\_ip](#input\_auth\_client\_ip) | A single IP or a single IP address range such as 10.1.10.11 or 10.10.1.0/24 indicates that all IPs are allowed. Please note that the IP entered should be CVM's private IP. | `list(string)` | <pre>[<br>  "10.0.0.1"<br>]</pre> | no |
| <a name="input_cfs_access_group_description"></a> [cfs\_access\_group\_description](#input\_cfs\_access\_group\_description) | Description of the access group, and max length is 255. | `string` | `"description"` | no |
| <a name="input_cfs_access_group_name"></a> [cfs\_access\_group\_name](#input\_cfs\_access\_group\_name) | Name of the access group, and max length is 64. | `string` | n/a | yes |
| <a name="input_cfs_map"></a> [cfs\_map](#input\_cfs\_map) | cfs map to create. If cfs\_name is not set, key will be cfs\_name. They all bind to the same cfs\_access\_group | `any` | `{}` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | The priority level of rule. Valid value ranges: (1~100). 1 indicates the highest priority. | `list(number)` | <pre>[<br>  1<br>]</pre> | no |
| <a name="input_rw_permission"></a> [rw\_permission](#input\_rw\_permission) | Read and write permissions. Valid values are RO and RW. and default is RO. | `list(string)` | <pre>[<br>  "RO"<br>]</pre> | no |
| <a name="input_user_permission"></a> [user\_permission](#input\_user\_permission) | The permissions of accessing users. Valid values are all\_squash, no\_all\_squash, root\_squash and no\_root\_squash. and default is root\_squash. all\_squash indicates that all access users are mapped as anonymous users or user groups; no\_all\_squash indicates that access users will match local users first and be mapped to anonymous users or user groups after matching failed; root\_squash indicates that map access root users to anonymous users or user groups; no\_root\_squash indicates that access root users keep root account permission. | `list(string)` | <pre>[<br>  "no_root_squash"<br>]</pre> | no |

// The variables below is to explain cfs_map keys, they are not used

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | ForceNew. The available zone that the file system locates at. | `string` | `""` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | File system capacity, in GiB (required for the Turbo series). For Standard Turbo, the minimum purchase required is 40,960 GiB (40 TiB) and the expansion increment is 20,480 GiB (20 TiB). For High-Performance Turbo, the minimum purchase required is 20,480 GiB (20 TiB) and the expansion increment is 10,240 GiB (10 TiB). | `number` | `null` | no |
| <a name="input_ccn_id"></a> [ccn\_id](#input\_ccn\_id) | CCN instance ID (required if the network type is CCN). | `string` | `null` | no |
| <a name="input_cfs_name"></a> [cfs\_name](#input\_cfs\_name) | Name of a file system. | `string` | `""` | no |
| <a name="input_cfs_tags"></a> [cfs\_tags](#input\_cfs\_tags) | cfs tags | `map(string)` | `{}` | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CCN IP range used by the CFS (required if the network type is CCN), which cannot conflict with other IP ranges bound in CCN. | `string` | `null` | no |
| <a name="input_mount_ip"></a> [mount\_ip](#input\_mount\_ip) | ForceNew. IP of mount point. | `string` | `null` | no |
| <a name="input_net_interface"></a> [net\_interface](#input\_net\_interface) | Network type, Default VPC. Valid values: VPC and CCN. Select VPC for a Standard or High-Performance file system, and CCN for a Standard Turbo or High-Performance Turbo one. | `string` | `"VPC"` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | ForceNew. File system protocol. Valid values: NFS, CIFS, TURBO. If this parameter is left empty, NFS is used by default. For the Turbo series, you must set this parameter to TURBO. | `string` | `"NFS"` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | ForceNew. Storage type of the file system. Valid values: SD (Standard), HP (High-Performance), TB (Standard Turbo), and TP (High-Performance Turbo). Default value: SD. | `string` | `"SD"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ForceNew. ID of a subnet. | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ForceNew. ID of a VPC network. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cfs_ids"></a> [cfs\_ids](#output\_cfs\_ids) | IDs of CFS file system. |
| <a name="output_cfs_ips"></a> [cfs\_ips](#output\_cfs\_ips) | IPs of mount point for CFS file system. |
<!-- END_TF_DOCS -->

## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
