# Ansible playbooks

This repository contains a playbook to configure my desktop environment.

It's based on any ArchLinux distribution like Manjaro for example.

To be able to run this playbooks on a new machine I've todo the following steps before:

- Update Pacman cache and install all updates
- Activate AUR in Pacman

Now you can either clone https://github.com/janbaer/ansible.git locally and run `./run-playbook.sh`

This will install the following packages before running Ansible.

- ansible
- ansible-aur-git
- yay-bin

After the packages are installed, `ansible-playbook` will run with using the hostname of you machine for the **-limit** filter.

Alternatively you can also install the packages manually with using the following command:

```
pamac install --no-confirm ansible ansible-aur-git yay-bin
```

Now just run

```
ansible-pull --limit $(cat /etc/hostname) -e @group_vars/vault.yml --ask-vault-password --ask-become-pass --url https://github.com/janbaer/ansible.git playbook.yml
```

After this it's necessary to logoff and choose i3 as window manager before login again.

In case you want to test the project before pushing it to GitHub on a fresh installed system, you can very easily copy the project with one simple command to the target system.

```
rsync -avP ~/Projects/ansible/ jan@{ip-address}:/home/jan/ansible
```

You need to activate the `sshd` service on the target system before.
