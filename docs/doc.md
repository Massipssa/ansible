
# Install

## Centos 7

- Install in server node: ```yum install ansible -y```
- Exchange ssh keys between the server and the clients
  - Generate key in the server````ssh-keygen```` (let all as default)
  - Copy key to all the clients ````ssh-copy-id <user>@<client-host>````
- Add all nodes to ***/etc/ansible/hosts*** on the server

```
  [servers]
  server1 ansible_host=<client2-ip> ansible_user=<user>
  server2 ansible_host=<client2-ip> ansible_user=<user>
  server3 ansible_host=<client2-ip> ansible_user=<user>
```
  
## Ansible basics

- Run `ansible-playbook playbook.yml`

- Some modules:
  - yum, user, service, git
