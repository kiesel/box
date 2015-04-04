#!/bin/bash
set -e -u 

# Determine whether we need to install `ansible` itself
which ansible >/dev/null || {
  echo "===> Installing ansible ..."
  sudo apt-get update
  sudo apt-get install -y ansible
}

echo "===> Running ansible-playbook"

# Copy hosts file into system and change mode to non-executable; once this file has the +x
# bit set, ansible tries to interpret it by running it; given the host is a Windows system
# you cannot reliably change the file's mode, therefore copy it into the machine
sudo cp /vagrant/ansible/hosts /etc/ansible/hosts && sudo chmod 666 /etc/ansible/hosts
sudo PYTHONUNBUFFERED=1 ANSIBLE_NOCOWS=1 ansible-playbook --connection=local /vagrant/ansible/site.yml