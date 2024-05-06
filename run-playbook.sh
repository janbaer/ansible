#!/bin/bash

export ANSIBLE_STDOUT_CALLBACK="yaml"

function cleanup {
  echo "Cleaning up..."
  rm -r ./.vault_pass
}

trap cleanup EXIT

if [ $# -eq 0 ]; then
  echo "Install some preconditions..."
  pamac install --no-confirm ansible yay fakeroot ansible-aur
fi

HOST=$(tr '[:upper:]' '[:lower:]' < /etc/hostname)

echo "Run playbook playbook.yml on machine ${HOST}"

if command -v gopass &> /dev/null; then
  echo "Read passwords from gopass"
  become_pass=$(gopass /ansible/become_password)
  vault_pass=$(gopass /ansible/vault_password)
fi

if [ -n "${become_pass}" ] && [ -n "${vault_pass}" ]; then
  echo "Use passwords from gopass"
  echo "$vault_pass" > .vault_pass
  export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass

  ansible-playbook playbook.yml \
    -e @group_vars/vault.yml    \
    -e ansible_become_pass="$become_pass"\
    -e ansible_vault_pass="$vault_pass"\
    --limit="${HOST}" --diff "$@"
else
  ansible-playbook playbook.yml -e @group_vars/vault.yml --limit="${HOST}" --ask-become-pass --ask-vault-pass --diff "$@"
fi
