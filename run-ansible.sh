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
sudo ansible-playbook /vagrant/site.yml -i /vagrant/hosts --connection=local /vagrant/playbooks/playbook.yml