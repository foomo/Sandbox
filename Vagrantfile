# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # this one is nice
  # https://github.com/mootools/mootools-forge/blob/master/Vagrantfile

  #----------------------------------------------------------------------------
  # ~ SETTINGS
  #----------------------------------------------------------------------------

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "foomo-test"

  # fetch from here, if not locally present
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"


  # host names on the host machine
  # needs : vagrant plugin install vagrant-hostsupdater
  config.vm.hostname = "test.foomo"
  # give more names
  #config.hostsupdater.aliases = ["alias-test.foomo"]


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.56.101"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    # show the vb gui or not
    vb.gui = false
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end


  # nfs
  config.vm.synced_folder ".", "/var/www", type: "nfs"
  #, owner: "www-data:www-data"

  #----------------------------------------------------------------------------
  # ~ PROVISIONING
  #----------------------------------------------------------------------------

  # SHELL

  config.vm.provision "shell" do |shell|
    shell.path = "vagrant-provision.sh"
  end

  config.vm.provision "docker" do |docker|
    docker.pull_images "janhalfar/foomo-app-runner"
    docker.run "foomo-app-runner", cmd: "/usr/bin/run-foomo-apps.sh", args: "-h 'test.foomo alias-test.foomo' -v '/var/www:/var/www' -p 80:80", image: 'janhalfar/foomo-app-runner'
  end

end
