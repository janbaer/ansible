#!/bin/bash

export ANSIBLE_STDOUT_CALLBACK="yaml"

if [ $# -eq 0 ]; then
  echo "Install some preconditions..."
  pamac install --no-confirm ansible yay fakeroot ansible-aur
fi

HOST=$(tr '[:upper:]' '[:lower:]' < /etc/hostname)

echo "Run playbook playbook.yml on machine ${HOST}"

ansible-playbook playbook.yml -e @group_vars/vault.yml --limit="${HOST}" --ask-become-pass --ask-vault-pass --diff "$@"
