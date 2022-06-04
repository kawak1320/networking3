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
    <li><a href="#assignment-demo-instructions">Assignment Demo Instructions</a></li>
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

### Subnet Network Adress 
| IP ADRESS     | FIRST HOST    | LAST HOST     | BROADCAST       | SUBNET          |
| ---------     | ------------  | ---------     |  ----------     | ----------      | 
| 192.168.0.0   | 192.168.0.4   | 192.168.1.254 |  192.168.1.255  | 192.168.0.0/23  |
| 192.168.2.0   | 192.168.2.4   | 192.168.2.126 |  192.168.2.127  | 192.168.2.0/25  |
| 192.168.2.128 | 192.168.2.132 | 192.168.2.190 |  192.168.2.191  | 192.168.2.128/26|
| 192.168.2.192 | 192.168.2.196 | 192.168.2.254 |  192.168.2.255  | 192.168.2.192/26|
[View Table in PDF](https://github.com/kawak1320/networking3/blob/main/images/networking3-diagrams.pdf)

<p align="right">(<a href="#top">back to top</a>)</p>

### Infrastructure as Code Assignment

* Create a repository
* Replicate this infrastructure in a Custom VPC by using Terraform and applying the subnets you got in the Subnetting section.
* All the VPC components needed and even one EC2 instance per subnet at least should be created (Subnets, Route Tables, Internet Gateway, etc)
* Create a README in your repo explaining the Terraform commands needed to create the infrastructure.
* Attach a Diagram which explains the VPC and its components and indicating the IP assignations for the VPC and subnets.
[![Diagram Screen Shot](https://github.com/kawak1320/networking3/blob/main/images/diagram.png)

* Make sure that the public subnet can SSH to the private Subnets. 
* Deliver the link to your repository.

<p align="right">(<a href="#top">back to top</a>)</p>

### Assignment Demo Instructions

1. Clone the repo anywhere
   ```sh
   git clone https://github.com/kawak1320/networking3.git
   ```
2. Enter local directory `$ cd /networking3`.
3. Open a terminal inside this directory and open VS Code `$ .code`.
4. Once inside VSCode, reopen the project in Remote Container.
5. With the container up, `$ terraform init`
6. You will have to create a `keys.tf` file containing the following values:
```terraform
resource "aws_key_pair" "deployer" {
  key_name   = "your-kp-name"
  public_key = "your .pub key content"
}
```
7. When terraform initializes, make a new plan `$ terraform plan -out mp_vpc.tfplan`
8. After terraform plan succeeds, `$ terraform apply mp_vpc.tfplan`
9. To test SSH connections from Remote Office EC2 to any Private Office EC2, you will need to `$ scp` your .pem file to the Remote Office Host in order to be able to connect via ssh to the other Instances. In case you can't upload the file via `$ scp`, you can always create the .pem file manually and add the values via your favourite console editor.

<p align="right">(<a href="#top">back to top</a>)</p>


