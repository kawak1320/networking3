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

| IP ADRESS | FIRST HOST            | LAST HOST  | BROADCAST  | SUBNET  |
| --------- | ------------------- | --------- |
| 192.168.0.0 | 192.168.0.4 | 192.168.1.254    |  192.168.255 | 192.168.0.0/23  |
| 192.168.2.0      | Some long data here | more data | 

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


