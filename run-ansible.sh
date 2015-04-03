#!/bin/bash

set -e -u 

echo "---> Running as $(whoami)"

# Determine whether we need to install `ansible` itself
which ansible >/dev/null || {
  echo "===> Installing ansible ..."
  sudo aptitude update 
  sudo aptitude install -y ansible 
}

echo "===> Running ansible-playbook"
sudo cp /vagrant/ansible/hosts /etc/ansible/hosts && sudo chmod 666 /etc/ansible/hosts
sudo ansible-playbook --connection=local /vagrant/ansible/site.yml