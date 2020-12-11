# Install

This Ansible Playbook will install and configure VS Code, node.js (via nvm), emacs, and tmux.

Ansible installation taken from the [official instructions](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-debian):

## Run ansible.sh

```bash
#!/bin/bash

# Exit on any error
set -e

# Get ansible
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/ap
t/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt update
apt --yes install ansible

# Install ansible playbook & run
git clone https://github.com/tbuckley/ansible.git
pushd ansible
ansible-galaxy install -r requirements.yml -p roles/
ansible-playbook penguin.yml
popd
```

## Final setup for git

1. `git config --global user.name "NAME"`
2. `git config --global user.email "EMAIL"`
3. `ssh-keygen -t rsa -b 4096 -C "EMAIL"`
