# Ansible playbooks

This repository contains some playbooks to configure my desktop environment.

It's based on any ArchLinux distribution like Manjaro for example.

To be able to run this playbooks on a new machine I've todo the following steps before:

- Update Pacman cache and install all updates
- Activate AUR in Pacman
- Install ansible and ansible-aur-git with Pacman
- Install Dropbox with Pacman and login with my personal account
- Install KeePassX2 and copy SSH keys from my KeePass db to ~/.ssh
- Change access flags for all files in ~/.ssh to 0600
- Clone project Ansible (git@github.com:janbaer/ansible.git) from Github to ~/Projects/ansible
- Run playbooks with `sudo ./run-allplaybooks`

After this it's necessary to reboot the system to be able to login with i3 as window manager.



