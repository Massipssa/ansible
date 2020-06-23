
**Pull configuration:** Salves check periodicallaly from master
**Push configuration:** Master push config to salaves. In this case we don't need Ansible to be installed in slaves

## Archi 
* **Local machine**
    * Modules (Playbooks)
    * Inventory
* **Nodes**
* Local machine and nodes conmunicate usin SSH  

* Playbook

```yaml
    # indicate start
    ---
    - name: play1
        # the names of servers will be found in inventory
        - host: webserver
        - tasks:
            - name: install apache
              yum:
                name: apache
                state: present
            - name:
              service:
                name: apache
                state: start
    - name: play2
        # the name to be found in inventory
        - host: mysqlserver
        - tasks:
            - name: install Mysql
              yum:
                name: install
                state: present
```

* **Inventory:** where we maintains the structure of our network structure
```
[webserver]
ma1.hotname
ma2.hotname
ma3.hotname

[mysqlserver]
dabase1.hotname
dabase2.hotname
dabase3.hotname
```

* Ansible tower: framework desgin to access Ansible using GUI
* We can use jinja templating in ansible
* Loops: 
```yaml 
    tasks: 
    - name: Install packages 
      # loops
      apt: name={{item}} state=present  
      with_items:
        - python
        - python-pip
        - vim
```

### Commands: 
- ```ansible-playbook -i inventory playbook_name.yml```

* **Roles**
- Break tasks down to avoid large playbook
- Way of groupig tasks togher

