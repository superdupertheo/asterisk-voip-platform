# PHASE 1 --- TERRAFORM INFRASTRUCTURE

This directory contains the Infrastructure as Code used to provision the
AWS infrastructure for the **Podman + Kubernetes Asterisk VoIP Platform**.

Terraform is responsible for creating the AWS networking, security, and
compute resources that will later be configured by Ansible and used to
deploy the containerized Asterisk PBX on a Kubernetes (k3s) cluster,
allowing SIP clients to register and communicate securely.


## Phase 1 Deliverables
- [ ] `versions.tf` defines the required Terraform version and AWS provider version/configuration.
- [ ] `main.tf` provisions the AWS networking infrastructure and Rocky Linux EC2 server.
- [ ] `variables.tf` defines all configurable infrastructure settings.
- [ ] `outputs.tf` exposes the information required to access and configure the server.
- [ ] `terraform.tfvars` provides environment-specific values for the Terraform variables.
- [ ] `terraform validate` completes successfully.
- [ ] `terraform plan` produces the expected infrastructure changes.
- [ ] AWS VPC, subnet, internet gateway, route table, and security group are created successfully.
- [ ] Rocky Linux EC2 instance launches successfully with encrypted storage and the correct security group attached.
- [ ] SSH access to the server works from the administrator network.
- [ ] SIP (UDP 5060) and RTP (UDP 10000–10100) traffic are restricted to the trusted client network.
- [ ] Terraform outputs provide the server's public IP, private IP, SSH command, and SIP server address for use by Ansible and softphone configuration. 

------------------------------------------------------------------------

# Phase 1A --- `main.tf`

`main.tf` contains the primary AWS infrastructure resources for the
project.

It defines **what Terraform creates** to support the Podman + Kubernetes
Asterisk VoIP Platform.

### Responsibilities

- Configure the AWS provider.
- Create the Virtual Private Cloud (VPC).
- Create the public subnet and Internet Gateway.
- Configure the route table for Internet access.
- Create the security group for SSH, SIP, and RTP traffic.
- Provision the Rocky Linux EC2 server.
- Configure encrypted root storage.
- Enable Instance Metadata Service Version 2 (IMDSv2).
- Apply consistent project tags to AWS resources.

### Deliverables

- [ ] AWS provider configured using `var.aws_region`.
- [ ] Virtual Private Cloud (VPC) created successfully.
- [ ] Internet Gateway attached to the VPC.
- [ ] Public subnet created in the selected Availability Zone.
- [ ] Route table configured to provide Internet access.
- [ ] Public subnet associated with the route table.
- [ ] Security group successfully created.
- [ ] SSH access restricted to `var.admin_cidr`.
- [ ] SIP (UDP 5060) access restricted to `var.sip_client_cidr`.
- [ ] RTP (UDP 10000–10100) access restricted to `var.sip_client_cidr`.
- [ ] Rocky Linux EC2 instance provisioned using `var.ami_id`.
- [ ] EC2 instance type controlled through `var.instance_type`.
- [ ] AWS SSH key pair attached using `var.key_name`.
- [ ] Security group attached to the EC2 instance.
- [ ] Root EBS volume uses the `gp3` volume type.
- [ ] Root EBS volume encryption enabled.
- [ ] Instance Metadata Service Version 2 (IMDSv2) enabled.
- [ ] Project tags applied consistently to all AWS resources.

### Why are we defining the CIDR block now despite not
### technically knowing the IP we can have?

So with VPC this is not assigned by AWS. I can pick any IP range as long as
its from one of the RFC 1918 private address ranges. It just cannot overlap with future 
vpcs

## why does this project have a vpc and not ffmpeg?

They both showcased different sides of DEV-OPS. One was more application and configuration 
heavy with the intention of trying to produce a product.
I wanted to also test out using a default VPC and subnet in the ffmpeg, and then explicitly define it
it in the Asterisk project.

The asterisk project showcases how it would be to manage a server or infrastructure
and this works hand in hand with many networking heavy concepts.
Terraform really shines here

------------------------------------------------------------------------

# Phase 1B --- `variables.tf`


`variables.tf` defines the configurable inputs used by the Terraform
configuration.

Instead of placing environment-specific values directly inside
`main.tf`, Terraform references variables such as:

```hcl
var.aws_region
var.project_name
var.instance_type
var.ami_id
var.key_name
var.admin_cidr
var.sip_client_cidr
```

These variables make the infrastructure reusable across different AWS
accounts, regions, environments, and trusted client networks without
modifying the Terraform source code. 

### Responsibilities

- Define the configurable input variables used by the Terraform configuration.
- Specify AWS deployment settings such as the region and project name.
- Configure the EC2 instance settings, including the AMI ID and instance type.
- Define the AWS SSH key pair used to access the server.
- Configure network access restrictions for SSH administration.
- Configure trusted client network access for SIP and RTP traffic.
- Validate user-provided input where appropriate (for example, CIDR blocks).
- Separate environment-specific values from the infrastructure code.
- Improve the portability and reusability of the Terraform configuration.

### Deliverables

- [ ] `aws_region` variable defined for the AWS provider.
- [ ] `project_name` variable defined for consistent resource naming and tagging.
- [ ] `instance_type` variable defined for the EC2 instance size.
- [ ] `ami_id` variable defined for the Rocky Linux AMI.
- [ ] `key_name` variable defined for the AWS EC2 key pair.
- [ ] `admin_cidr` variable defined for SSH access restrictions.
- [ ] `sip_client_cidr` variable defined for SIP and RTP access restrictions.
- [ ] Variable descriptions provided for all configurable inputs.
- [ ] Appropriate default values defined where applicable.
- [ ] Input validation implemented for CIDR block variables.
- [ ] Infrastructure configuration contains no hard-coded environment-specific values.
- [ ] Variables can be overridden through `terraform.tfvars` or the command line.


