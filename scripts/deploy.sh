# run ansible playbook with input params
ansible-playbook playbook-app.yaml \
 --extra-vars "app_path=/home/massi/ansible/test_deploy deploy_method=pip version=0.0.1"