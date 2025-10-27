Project Overview


This project demonstrates how to deploy a complete web application on AWS using Terraform for infrastructure provisioning and Ansible for configuration management.
It automates the creation of a secure network (VPC, subnets, NAT, routes), provisions EC2 web servers and an RDS MySQL database, and configures Nginx automatically using Ansible.

<img width="541" height="217" alt="image" src="https://github.com/user-attachments/assets/689878f9-727d-42c5-9b11-64b0150cd3f5" />



Terraform: Builds the AWS infrastructure.


AWS: Hosts all deployed resources (VPC, EC2, RDS, NAT, IGW).

Ansible: Connects to EC2 instances for post-deployment configuration.

Nginx: Serves the static HTML webpage on each EC2 instance.



Technologies Used


Terraform — Infrastructure as Code (IaC)

Ansible — Configuration management

AWS Services — VPC, Subnets, EC2, RDS, NAT Gateway, Internet Gateway

Nginx — Web server

Amazon S3 — Terraform backend for state management



Terraform will:

Create a VPC with public & private subnets

Launch 2 EC2 instances in the public subnet

Create an RDS MySQL instance in the private subnet

Output the web server public IP addresses

Configure the Web Servers with Ansible

Edit your inventory file with the EC2 public IPs, then run:

ansible-playbook -i inventory ansible/playbook.yml



This will:

Install Nginx

Deploy your custom HTML page

Configure /etc/nginx/conf.d/default.conf

Start and enable the Nginx service

Access the Web Application


Open your browser and visit:


http://<EC2_PUBLIC_IP>

you must show this web page 

 <img width="1908" height="688" alt="image" src="https://github.com/user-attachments/assets/5ba43c16-1bc3-4e23-a2aa-e11ceb3cda53" />




| Component            | Description                                  |
| -------------------- | -------------------------------------------- |
| **VPC**              | Isolated network environment for the project |
| **Public Subnet**    | Hosts Nginx web servers (EC2)                |
| **Private Subnet**   | Hosts MySQL RDS database                     |
| **NAT Gateway**      | Allows private subnet to access the Internet |
| **Internet Gateway** | Enables web access to public subnet          |
| **Security Groups**  | Restrict and control traffic flow            |
| **Ansible**          | Automates Nginx setup and deployment         |




Future Enhancements


Add Application Load Balancer (ALB) for high availability.

Implement Route 53 for domain-based access.

Introduce CI/CD pipeline (GitHub Actions / Jenkins).

Add CloudWatch Monitoring for system metrics and logs.

Use Ansible roles for modular playbook structure.



 

