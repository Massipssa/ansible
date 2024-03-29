# Ansible

- It's configuration management tool
- Hybrid language (declarative and imperative)
- Hasn't lifecycle management
- Agent-less  
- Uses  
  - **Pull configuration:** Slaves check periodically from master
  - **Push configuration:** Master push config to slaves. In this case we don't need Ansible to be installed in the slaves.

## Architecture

- **Nodes**
  - Control machine
  - Remote machine
- Control machine and remote machines communicate using SSH  

## Playbooks

- Describe the instructions to execute
- Run a playbook: ````ansible-playbook [playbook_name.yml]````
- Example:

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

## Ad-hoc commands

- copy file: ```ansible hosts -m copy -a "src=/path/to/src/file.txt dest=/path/to/dest/file.txt" ```
- create a file: ```ansible hosts -m file -a "dest=/path/to/src/file.txt mode=700 owner=massi group=massi state = directory" ```
- delete a file: ```ansible hosts -m file -a "dest=/path/to/src/file.txt state = absent" ```
- list tags: ``ansible-playbook [playbook] --list-tags``

## Inventory

- Defines the machines (nodes) where to deploy the artifacts

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

- Ansible tower: framework design to access Ansible using GUI
- We can use Jinja templating in ansible
- Loops:

```yaml
    tasks: 
    - name: Install packages 
      # loops
      apt: 
        name: {{item}}
        state: present  
      with_items:
        - python
        - python-pip
        - vim
```

## Some modules

- copy, file, find, yum, user, service
- git, pip

## Roles

- Break tasks down to avoid large playbook
- Way of grouping tasks together
- Create a role: `ansible-galaxy init [role-name]`
