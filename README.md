# Ronin  
Contact: antoniaelsen@gmail.com

## About

Ronin is a collection of modular Vagrantfiles.

### Authors

 - Antonia Elsen - antoniaelsen@gmail.com

## Requirements

Ubuntu or Mac OSX

- Vagrant
- Ansible

## Usage

- `vagrant up --provision` to pull down the vagrant box (default `bento/ubuntu-16.04`). Any vagrant-compatible ruby files in the `/setup` directory will be run, followed by virtualbox configuration, folled by ruby files in the `/provisioning` directory.
- `vagrant ssh` to ssh into the vagrant box.

### Vagrantfiles

- `/setup`
  - `configure_interfaces.rb` will configure any interfaces defined in `interfaces.rb`.
  - `configure_shared_directiores.rb` will share any directories defined in `shared_directories.rb` with the vagrant box.
  - `configure shared_keys` will share the specified ssh keys with the box.
- `/provisioning`
  - `provision_ubuntu_desktop_.rb` will install `lightdm` and `ubuntu-desktop`.
  - `provision_ansible_playbook.rb` will provision the vagrantbox with the playbook in `ansible_playbooks.rb`