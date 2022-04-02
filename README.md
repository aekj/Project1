# Project1
Homework for Elk Stack Project
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

<img width="455" alt="Azure Cloud Network Security Diagram with Elk" src="https://user-images.githubusercontent.com/90976788/161165352-63572cad-2b86-4868-8923-99a37b5ee7a6.png">


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the the yaml file may be used to install only certain pieces of it, such as Filebeat.

  - https://github.com/aekj/Project1/blob/main/Ansible/filebeat-playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly effisient, in addition to restricting traffic to the network.
- Load balancer defends an organization against distributed denial-of-service (DDoS) attacks. It does this by shifting attack traffic across multiple servers.
- The advantage of a jump box are : 1) Increase in productivity. With the help of jump servers, it becomes easier for the admin to complete the work on the different networks without multiple logging in and logging outs into the prioritized area.
- 2)Security increment. Jump box's provide an additional layer of security from the public internet by controlling access to the other machines by allowing connections from specific IP addresses and forwarding to those machines.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the  file systems of the VM's and system metrics.

- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them  to Elasticsearch for indexing.
- Metricbeat takes the metrics and statistics that it collects and ships them to the output to Elasticsearch. Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function  | IP Address | Operating System   |
|----------|-----------|------------|--------------------|
| Jump Box | Gateway   | 10.0.0.8   | Linux(ubtntu 18.04)|
| Web1     | Web Server| 10.0.014   | Linux(ubtntu 18.04)|
| Web2     | Web Server| 10.0.0.16  | Linux(ubtntu 18.04)|
| Web3     | Web Server| 10.0.0.17  | Linux(ubtntu 18.04)|
| Elk      | Elk Server| 10.2.0.4   | Linux(ubtntu 18.04)|

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the  jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 24.7.218.69

Machines within the network can only be accessed by Jump Box.
- Only the Jump Box has access to the ELK VM 10.2.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 |     24.7.218.69      |
| Web1     | No                  |     10.0.0.8         |
| Web2     | No                  |     10.0.0.8         |
| Web3     | No                  |     10.0.0.8         |
| Elk      | No                  |     10.0.0.8         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because  it allows changes to be made within any of the VMs associated with it. And it allows for consistent, repeatable configuration that reduces the time of deployment and errors.

The playbook implements the following tasks:
1. Install docker.io
2. Install python3-pip
3. Install Docker module
4. Increase virtual memory
5. Download and launch a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

<img width="607" alt="docker_ps" src="https://user-images.githubusercontent.com/90976788/161191759-6b2ed81a-d13a-414d-a0a2-463b8f43b9e9.png">


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web1- 10.0.0.14, Web2- 10.0.0.16, Web3- 10.0.0.17

We have installed the following Beats on these machines:
1-Filebeat
2-Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects linux logs. This allows us to track things like user logon events, failed access attempts, service starts and stops.
- Metricbeat collects system metrics from the web servers. We look for things like cpu usage, memory usage, drive space usage and drive space available for each host.
- 
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ansible.cfg file to ~/etc/ansible.
- Update theUpdate the the configuration file to include the webservers and ElkVM (private Ip address).
- Run the playbook, and navigate tohttp://[ELK.VM.IP]:5601/app/kibana (http://20.219.50.82:5601/app/kibana) to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_/etc/ansible/file/filebeat-configuration.yml
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_edit the /etc/ansible/hosts file to add webserver/elkserver ip addresses
- _Which URL do you navigate to in order to check that the ELK server is running? http://[ELK.VM.IP]:5601/app/kibana  (http://20.219.50.82:5601/app/kibana)

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
- ssh sysadmin@JumpBox(Public IP)
- sudo docker container list -a (locate your ansible container)
- sudo docker start container (name of the container)
- sudo docker attach container (name of the container)
- cd /etc/ansible
- curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat >> /etc/ansible/filebeat-config.yml
- nano hosts
- nano ansible.cfg
- ansible-playbook /etc/ansible/(name of the yml file).yml 
- ansible all -m ping
- 
- 
