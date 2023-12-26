#!/bin/bash

########### Git Installation ##################

sudo yum update
sudo yum install git 

########### Terraform Installation ############

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform


########### Docker Installation ###############

sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker


########### Jenkins Installation ##############

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo yum upgrade
install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins