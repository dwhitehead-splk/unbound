# Unbound Configuration

#### Related Confluence Links

# Usage

## Base Usage
Example: ansible-playbook unbound.yml -i hosts/local.yml --extra-vars "domain=k8sstuff.splunk.com,otherstuff.splunk.com"

## Ansible Galaxy
The role is being hosted here: https://galaxy.ansible.com/dwhitehead-splk/unbound/

Install with: ansible-galaxy install dwhitehead-splk.unbound

Example playbook:

```yaml
---
- hosts: all
  roles:
  - dwhitehead-splk.unbound
```

Running the play locally: ansible-playbook -i "localhost," -c local playbook-name.yml --extra-vars "domain=schweet.splunk.com"

## Bootstrapping via EC2 User-Data

```bash
#!/bin/bash -v
yum install epel-release -y
yum install python-pip -y
pip install ansible
ansible-galaxy install dwhitehead-splk.unbound
mkdir ~/ansible
cat >~/ansible/unbound.yml <<EOL
---
- hosts: all
  roles:
  - dwhitehead-splk.unbound
EOL
ansible-playbook -i "localhost," -c local ~/ansible/unbound.yml --extra-vars "domain=gelato.splunk.com"
```

It's recommended that the domains be passed as a variable by whatever is being used to configure the EC2 instance/launch configuration (e.g. terraform).
