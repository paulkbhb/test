[Originally created  by River Point Technology](https://www.riverpointtechnology.com)
# VMware VCSA Module

This repo contains a module to deploy a [VMware VCSA](https://docs.vmware.com/en/VMware-vSphere/6.7/com.vmware.vsphere.vcsa.doc/GUID-223C2821-BD98-4C7A-936B-7DBE96291BA4.html) vCenter server on a
[VMware](https://www.vmware.com/) hypervisor using [Terraform](https://www.terraform.io/).

The vCenter Server Appliance is a preconfigured Linux virtual machine, which is optimized for running VMware vCenter Server® and the associated services on Linux.

This Module uses the [VMware VCSA](https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/products/vCenter/vmw-datasheetvcenter.pdf) as a deployment artifact.


ssssssssssssssssss
## How do you use this Module?

This repo has the following structure:

* **template**: Contains the *vctemplate.json.tpl* file, which is a variablized form of the VCSA 7.0 CLI install answer file *vctemplate.json*
* **root folder**: The root folder contains all of the Terraform code necessary to populate and create the the *vctemplate.json* file, leveraging the `templatefile` function.  It then executes the VCSA CLI install, using the JSON answer file, and command line options.

Prerequisites:

* **VCSA installation media**: You must have access to the installation media.  It should be extracted to a path on the local system and accessible by the user executing the Terraform code.  Adjust the path to the *vcsa-deploy* executable accordingly. 
* **vctemplate.json location**: Your user must have access to create the *vctemplate.json* file on the local filesystem.  Adjust the paths as necessary.

