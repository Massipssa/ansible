- Install ansible on centos
   - Install in server node: ```yum install ansible -y```
   - Echanges ssh keys between server and the clients
        - Generate key in the server````ssh-keygen```` (let all as default)
        - Copy key to all the clients ````ssh-copy-id <user>@<client-host>````
   - Add all nodes to /etc/ansible/hosts on the server
        ````
            [servers]
            server1 ansible_host=<client2-ip> ansible_user=<user>
            server2 ansible_host=<client2-ip> ansible_user=<user>
            server3 ansible_host=<client2-ip> ansible_user=<user>
        ````
  