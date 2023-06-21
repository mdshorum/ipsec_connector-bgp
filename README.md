The purpose of this repository is to act as a source for the Terraform configuration required to provision an IPSec connector on an Alkira CXP. This repository will create a dynamic (using BGP) IPSec connector and will support any of the advanced options listed on the official Alkira provider:

https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/connector_ipsec

Separate repositories will be created to create other types of IPSec connectors, as well as cloud connectors. All of these raw files can then be linked for use in automation as needed.

Note: There is no terraform.tfvars file in this repository. When running a terraform apply or destroy, you will need to feed it input values. The tfvars file can be created manually to feed input values for all of the defined variables or you can leverage automation to create a tfvars file based on a web form, ticket, or similar input methods. Combining the tfvars file with this repo will yield a complete TF repo to build, modify, and destroy a dynamic IPSec connector.
