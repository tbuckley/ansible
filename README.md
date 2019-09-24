# Install

This Ansible Playbook will install and configure VS Code, node.js (via nvm), emacs, and tmux.

## Get Ansible on Debian Stretch

Taken from the [official instructions](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-debian):

1. Install dependencies: `sudo apt install gnupg`

2. Add the following line to `/etc/apt/sources.list`:
   ```
   deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
   ```

3. Then run these commands:
   ```
   $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
   $ sudo apt update
   $ sudo apt install ansible
   ```

## Run this playbook

1. `git clone https://github.com/tbuckley/ansible.git`
2. `cd ansible`
3. `ansible-galaxy install -r requirements.yml -p roles/`
4. `ansible-playbook penguin.yml`

## Final setup for git

1. `git config --global user.name "NAME"`
2. `git config --global user.email "EMAIL"`
3. `ssh-keygen -t rsa -b 4096 -C "EMAIL"`
