#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Install some preconditions..."
  pamac install --no-confirm ansible yay-bin ansible-aur-git
fi

HOST=$(cat /etc/hostname | tr '[:upper:]' '[:lower:]')
ANSIBLE_STDOUT_CALLBACK=yaml

echo "Run playbook playbook.yml on machine ${HOST}"

ansible-playbook playbook.yml --limit=${HOST} --ask-become-pass --ask-vault-pass --diff "$@"
