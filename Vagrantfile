# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

$set = <<-SCRIPT
echo "              __                    
.-----.-----.|  |_     .--.--.-----.
|__ --|  -__||   _|    |  |  |  _  |
|_____|_____||____|    |_____|   __|
                             |__|   "
sudo apt-get update
sudo apt-get install -y make git vim clang gcc gdb valgrind xorg libxext-dev zlib1g-dev libbsd-dev

SCRIPT

$docker = <<-SCRIPT
echo "    __              __               
.--|  |.-----.----.|  |--.-----.----.
|  _  ||  _  |  __||    <|  -__|   _|
|_____||_____|____||__|__|_____|__|  
                                     "
                                     
curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1 sh ./get-docker.sh
sh get-docker.sh

echo "    __              __                                                                  
.--|  |.-----.----.|  |--.-----.----.______.----.-----.--------.-----.-----.-----.-----.
|  _  ||  _  |  __||    <|  -__|   _|______|  __|  _  |        |  _  |  _  |__ --|  -__|
|_____||_____|____||__|__|_____|__|        |____|_____|__|__|__|   __|_____|_____|_____|
                                                               |__|                     "
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
SCRIPT

$user = <<-SCRIPT
echo "                        
.--.--.-----.-----.----.
|  |  |__ --|  -__|   _|
|_____|_____|_____|__|  
                        "
sudo useradd -m -s /bin/bash -G docker,sudo lukas
echo "lukas:vagrant" | chpasswd
SCRIPT

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-18.04"

  config.ssh.username = "lukas"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

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
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  #

  config.vm.provision "shell", inline: $set 
  config.vm.provision "shell", inline: $docker 
  config.vm.provision "shell", inline: $user 

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
