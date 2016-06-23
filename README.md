# docker-vagrant-debian

A Debian Docker image for Vagrant Docker provider.

This image is based on [official Debian image](https://hub.docker.com/_/debian/) and includes minimum Vagrant box features.

[![License X11](https://img.shields.io/badge/license-X11-brightgreen.svg)](https://raw.githubusercontent.com/nishidayuya/docker-vagrant-debian/master/LICENSE.txt)

# Supported tags and respective `Dockerfile` links

* [`8.5`, `8`, `jessie`, `latest` *Dockerfile*](https://github.com/nishidayuya/docker-vagrant-debian/blob/master/Dockerfile)
* [`7.11`, `7`, `wheezy` *Dockerfile*](https://github.com/nishidayuya/docker-vagrant-debian/blob/7-wheezy/Dockerfile)

Issues and pull-requests are available on [GitHub repository](https://github.com/nishidayuya/docker-vagrant-debian/).

# Usage

Write `Vagrantfile` as following:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["VAGRANT_DEFAULT_PROVIDER"] ||= "docker"
Vagrant.configure(2) do |config|
  config.vm.provider(:docker) do |d|
    d.image = "nishidayuya/docker-vagrant-debian:jessie"
    d.has_ssh = true
  end
end
```

Enjoy `vagrant up`, `vagrant ssh` and so on!

```
$ vagrant up
Bringing machine 'default' up with 'docker' provider...
==> default: Creating the container...
    default:   Name: try-docker-vagrant-debian_default_1466169221
    default:  Image: nishidayuya/docker-vagrant-debian:jessie
    default: Volume: /home/yuya/try-docker-vagrant-debian:/vagrant
    default:   Port: 127.0.0.1:2222:22
    default:
    default: Container created: 546abcdab956863f
==> default: Starting container...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 172.17.0.3:22
    default: SSH username: vagrant
    default: SSH auth method: private key
    default:
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
$ vagrant ssh

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
vagrant@546abcdab956:~$ sudo apt-get update
...
```
