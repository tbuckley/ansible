# Install

## Get Ansible on Debian Stretch

Taken from the [official instructions](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-debian):

1. Add the following line to `/etc/apt/sources.list`:
   `deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main`
2. Then run these commands:
   ```
   $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
   $ sudo apt update
   $ sudo apt install ansible
   ```

## Run this playbook

1. `ansible-galaxy install -r requirements.yml -p roles/`
2. `ansible-playbook penguin.yml`
