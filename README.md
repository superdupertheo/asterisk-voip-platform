# Small business internal phone system

An automated infrastructure pipeline that transforms a fresh Rocky Linux server
into a fully functional internal VoIP phone system with
registered SIP extensions, using Terraform, Ansible, Podman, Kubernetes (k3s),
Bash, and Asterisk.

The project is designed to demonstrate DevOps, Linux, Infrastructure as Code,
containerization, Kubernetes, automation, and real-time communications skills in a
single end-to-end project.

## Project Goal

The goal is to Build a fully automated cloud communications platform that provisions
AWS infrastructure, configures Rocky Linux, deploys Asterisk in Kubernetes,
and enables real-time voice communication between SIP softphones
through a reproducible Infrastructure-as-Code workflow.

The final pipeline produces:

* A fully provisioned AWS virtual machine running Rocky Linux.
* An automatically configured operating system using Ansible.
* A containerized Asterisk PBX built with Podman.
* A k3s Kubernetes cluster running the Asterisk workload.
* Registered SIP softphones (extensions 1001 and 1002).
  -Internal voice calling between registered extensions.
  -Automated, repeatable infrastructure deployment through Infrastructure as Code.
  -A reproducible real-time communications platform that can be redeployed from
  source at any time.

## Architecture

Terraform
|
v
AWS EC2 Rocky Linux VM
|
v
Ansible
|
+--> Install Podman
+--> Install k3s
+--> Install Asterisk dependencies
+--> Configure Linux services
+--> Configure networking and firewall
|
v
Podman
|
+--> Build Asterisk OCI image
+--> Package SIP configuration
+--> Test container locally
|
v
Kubernetes / k3s
|
+--> Deployment
+--> Service (SIP/RTP)
+--> ConfigMap
+--> PersistentVolume
+--> PersistentVolumeClaim
|
v
Asterisk
|
+--> Load PJSIP configuration
+--> Register extensions 1001 and 1002
+--> Load dialplan
+--> Start SIP and RTP services
|
v
SIP Softphones
|
+--> Register extension 1001
+--> Register extension 1002
+--> Authenticate with Asterisk
|
v
Voice Call Validation
|
+--> 1001 ↔ 1002 internal calling
+--> Echo test (600)
+--> Hello World test (700)
|
v
Fully Operational Internal VoIP Phone System

## Technology Stack

| Technology       | Purpose                                            |
| ---------------- | -------------------------------------------------- |
| Terraform        | Provision AWS infrastructure                       |
| AWS EC2          | Host the cloud VoIP server                         |
| Rocky Linux      | Linux operating system                             |
| Ansible          | Configure the VoIP server                          |
| Podman           | Build and test the Asterisk OCI container          |
| Kubernetes / k3s | Deploy and orchestrate the Asterisk workload       |
| Bash             | Automate deployment, configuration, and validation |
| Asterisk         | Provide SIP-based PBX and call routing             |
| PJSIP            | Register and manage SIP endpoints                  |
| RTP              | Transport real-time voice media between endpoints  |

## Deployment Workflow

1. Terraform provisions the Rocky Linux EC2 server.
2. Ansible configures the operating system and installs the required software.
3. Podman builds the Asterisk OCI container.
4. The container is tested locally.
5. The OCI image is imported into the k3s cluster.
6. Kubernetes creates the deployment, service, configuration, and persistent storage resources.
7. The Asterisk container is deployed and started within Kubernetes.
8. PJSIP loads the SIP configuration and registers softphone extensions 1001 and 1002.
9. The dialplan is loaded, enabling internal call routing and media services.
10. Voice communication is validated by placing calls between extensions and running the built-in Echo (600) and Hello World (700) test services.
11. The completed deployment provides a fully operational cloud-hosted internal VoIP phone system.

### Skills Demonstrated

This project demonstrates practical experience with:

* Infrastructure as Code (Terraform)
* AWS cloud infrastructure
* Linux administration
* Configuration management (Ansible)
* Containerization (Podman)
* Kubernetes (k3s) deployments
* VoIP infrastructure
* SIP and RTP protocols
* Asterisk PBX administration
* PJSIP endpoint configuration
* Network configuration and troubleshooting
* Bash scripting
* SELinux
* systemd
* Infrastructure troubleshooting

### Why Asterisk?

wanted to show hosting an application and also a server and something very networking and infrastructure heavy. basically a love letter to system administrators, also really refining my past cybersecurity experience with this one as networking was a huge part of my early career

