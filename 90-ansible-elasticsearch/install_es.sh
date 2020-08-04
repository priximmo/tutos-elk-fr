#!/usr/bin/bash

###############################################################
#  TITRE: 
#
#  AUTEUR:   Xavier
#  VERSION: 1.0
#  Source : https://github.com/elastic/ansible-elasticsearch
#  DESCRIPTION: Install elasticsearch
###############################################################




# Functions ###################################################

install_role(){
sudo apt install -y sshpass
mkdir roles
ansible-galaxy install elastic.elasticsearch,7.8.1 -p roles
}

create_inventory(){
echo '
all:
  hosts:
    node1:
      ansible_host: 192.168.13.10
    node2:
      ansible_host: 192.168.13.11
'> inventory.yml
}

create_playbook(){
echo '
- name: install eS
  hosts: all
  roles:
    - role: elastic.elasticsearch
  vars:
    es_heap_size: "1g"
    es_config:
      cluster.name: "es"
      network.host: "{{ ansible_host }}"
      cluster.initial_master_nodes: "node1"
      #discovery.seed_hosts: "node1:9300,node2:9300"
      discovery.zen.ping.unicast.hosts: "node1,node2"
      http.port: 9200
      node.master: true
      node.data: true
'> playbook.yml
}

run_ansible(){
ansible-galaxy install elastic.elasticsearch,7.8.1 -p roles
}


# Let's Go !! #################################################

install_role
create_inventory
create_playbook
run_ansible
