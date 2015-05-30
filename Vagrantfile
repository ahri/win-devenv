# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end


  config.vm.provision "shell", inline: <<-SHELL
    set -xue

    apt-get update -q
    curl -s https://raw.githubusercontent.com/ahri/dotfiles/master/bootstrap-new-linux.sh | bash

    su - vagrant -c "mkdir ~vagrant/nodejs && cd ~vagrant/nodejs && wget -q https://iojs.org/dist/v2.1.0/iojs-v2.1.0-linux-x64.tar.gz && tar zxvf iojs-v2.1.0-linux-x64.tar.gz && echo 'export PATH=\\"\\\$HOME/nodejs/iojs-v2.1.0-linux-x64/bin:\\\$PATH\\"' >> ~/.profile"
    apt-get install -y chromium-browser firefox
    # https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    # dpkg -i google-chrome-stable_current_amd64.deb

    # get a decent editor running
    su - vagrant -c "mkdir ~vagrant/repos/"
    su - vagrant -c "git clone https://github.com/ahri/dotfiles.git ~vagrant/repos/dotfiles"
    su - vagrant -c "cd ~vagrant/repos/dotfiles && rake"

    apt-get clean
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  SHELL

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
end
