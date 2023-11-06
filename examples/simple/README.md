# Simple CFS

Configuration in this directory creates set of CFS resources which may be sufficient for development environment.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money (AWS Elastic IP, for example). Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.9 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >=1.81.16 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cfs"></a> [cfs](#module\_cfs) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | IDs of CFS file system. |
<!-- END_TF_DOCS -->