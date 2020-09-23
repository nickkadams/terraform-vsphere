# Terraform VMware vSphere Provider

> This repository contains Terraform code that uses the [VMware vSphere Provider](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs) to build vSphere infrastructure.

## Table of Contents

- [Terraform VMware vSphere Provider](#terraform-vsphere)
  - [Table of Contents](#table-of-contents)
  - [Tools](#tools)
  - [Usage](#usage)
  - [Author Information](#author-information)
  - [License](#license)

## Tools

- [tfenv install latest](https://github.com/tfutils/tfenv)
- [terraform fmt](https://www.terraform.io/docs/commands/fmt.html)
- [terraform validate](https://www.terraform.io/docs/commands/validate.html)
- [TFLint](https://github.com/terraform-linters/tflint)
- [pre-commit](https://pre-commit.com)

## Usage

If you want to override the default variables in [variables.tf](https://github.com/nickkadams/terraform-vsphere/blob/main/cluster/variables.tf), copy [terraform.tfvars.sample](https://github.com/nickkadams/terraform-vsphere/blob/main/cluster/terraform.tfvars.sample) to `terraform.tfvars` and fill in your specific information.

1. `cd cluster` or another relevant infrastructure directory.
1. Initialize the Terraform directory (`.terraform/`) by running `terraform init`
1. Create the Terraform execution plan by running `terraform plan`
1. If everything looks correct, you can apply the Terraform changes by running `terraform apply` and typing `yes` when prompted.
1. If this is *NOT* production and you are finished testing, you can destroy the infrastructure by running `terraform destroy` and typing `yes` when prompted.

## Author Information

This repository is maintained by [Nick Adams](https://github.com/nickkadams).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
