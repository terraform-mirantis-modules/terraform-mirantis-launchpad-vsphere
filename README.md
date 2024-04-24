# Terraform for Launchpad on VMWare's VSphere

A terraform module for preparing a basic vsphere compute cluster for Launchpad installation.

[Launchpad]{https://docs.mirantis.com/mke/3.7/launchpad.html} is a Mirantis tool for installation 
of Mirantis Containers products. The tool can work with any properly prepared accessible cluster,
This module can create a basic simple cluster, and provide the appropriate Launchpad configuration
for use with Launchpad.

## Prerequisites

* You need VMware vSphere credentials for API operations
* Terraform [installed](https://learn.hashicorp.com/terraform/getting-started/install)

### Authentication

The Terraform `vsphere` provider uses parametrization for access configuration. This module collects 
input arguments for configuring the provider. This is described further below.
See [here](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs) for more information.

## Usage

Use the module to create a basic compute cluster with HCL as follows:

```
module "provision" {
  source = "terraform-mirantis-modules/launchpad-vsphere/mirantis"

  cluster_name = "my-cluster" 

  template_vm_linux = "ubuntu_18" // must exist in your datacenter

  quantity_managers = 1
  quantity_workers  = 3
}
```

Then use the `mke_cluster` output for the launchpad yaml:

```
terraform output -raw mke_cluster > launchpad.yaml
launchpad apply
```

### VSphere Configuration

You can also control a few more details that configure vsphere interaction:

1. `vsphere_server` URL of the server
2. `vsphere_user` connection user
3. `vsphere_password` password for the user
4. `datacenter` vsphere data center
5. `resource_pool` vsphere resource pool
6. `folder` resource folder
7. `datastore_cluster` datastore 

### Windows workers 

This module does not support windows workers at this time.
