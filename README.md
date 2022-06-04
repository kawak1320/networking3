<br />
<div align="center">
  <a href="https://github.com/kawak1320/networking3">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Networking Assignment 03</h3>

  <p align="center">
    Jalasoft DevOps Bootcamp Subnetting and Terraform Infrastructure provisioning
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#subnetting-assigmnent">Subnetting Assignment</a></li>
    <li><a href="#infrastructure-as-code-assignment">Infrastructure as Code Assignment</a></li>
    <li><a href="#assignment-instructions">Assignment Instructions</a></li>
  </ol>
</details>

## Subnetting Assigmnent

We have 4 offices:
* Office 1: 80 hosts
* Office 2: 500 hosts
* Office 3: 40 hosts
* Remote Office: 30 hosts (public subnet)

Subnetting Requirements:
* Network ID 192.168.0.0/20
* Apply CIDR and VLSM concepts
* Only get the subnets for the 4 offices, no more.
* Deliver the Subnet Network Address, first and last assignable IPs and Broadcast for each subnet you got in a PDF file.

### Subnet Network Adress [View in PDF](https://github.com/kawak1320/networking3/images/sna.pdf)
| IP ADRESS     | FIRST HOST    | LAST HOST     | BROADCAST       | SUBNET          |
| ---------     | ------------  | ---------     |  ----------     | ----------      | 
| 192.168.0.0   | 192.168.0.4   | 192.168.1.254 |  192.168.1.255  | 192.168.0.0/23  |
| 192.168.2.0   | 192.168.2.4   | 192.168.2.126 |  192.168.2.127  | 192.168.2.0/25  |
| 192.168.2.128 | 192.168.2.132 | 192.168.2.190 |  192.168.2.191  | 192.168.2.128/26|
| 192.168.2.192 | 192.168.2.196 | 192.168.2.254 |  192.168.2.255  | 192.168.2.192/26|

<p align="right">(<a href="#top">back to top</a>)</p>

### Infrastructure as Code Assignment

* Create a repository
* Replicate this infrastructure in a Custom VPC by using Terraform and applying the subnets you got in the Subnetting section.
* All the VPC components needed and even one EC2 instance per subnet at least should be created (Subnets, Route Tables, Internet Gateway, etc)
* Create a README in your repo explaining the Terraform commands needed to create the infrastructure.
* Attach a Diagram which explains the VPC and its components and indicating the IP assignations for the VPC and subnets.
* Make sure that the public subnet can SSH to the private Subnets. 
* Deliver the link to your repository.

<p align="right">(<a href="#top">back to top</a>)</p>

### Assignment Instructions

1. Clone the repo anywhere
   ```sh
   git clone https://github.com/kawak1320/networking3.git
   ```
2. Enter local directory `$ cd /networking3`.
3. Open a terminal inside this directory and open VS Code `$ .code`.
4. Once inside VSCode, reopen Remote Container.
5. With the container is up, `$ terraform init`
6. You will have to create a `keys.tf` file containing the following values:
```terraform
resource "aws_key_pair" "deployer" {
  key_name   = "MartinPavesio-KP"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCGYkl58FiVlpvuM5zY0qqCJAqOjkkYbqoWH6FlFkPmE76YkSzMtQBXfpR0T29huJ6Do3hd5KZftIxh7up8xy5ri15xfDGcmy8nR+BHZI0FgDv6+SCd1felYH0uiPOPxR5Wh7TIdXXV8H+38t4GywZctS9dkT9xKYr6Mxszt0yj/4+xhSM646r/1A/eJsGS3su7R8tqS/bq/L+Tb7HusDU+j1BhGr03SO0kXBDyyVXYgWuOXFPgqIaPlAqArJOLBJSufuO5cE2u5u0cnfzJuUh54Oq1ZeMAvFax4+0nYW45HgtPPx3n7wLJ/qYDRsl55SGhknBZnAfjKxDHzwtHA8ht"
}
```
7. When terraform initializes, make a new plan `$ terraform plan -out mp_vpc.tfplan`
8. After terraform plan succeeds, `$ terraform apply mp_vpc.tfplan`

`$ `

<p align="right">(<a href="#top">back to top</a>)</p>


