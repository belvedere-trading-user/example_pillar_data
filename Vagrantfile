VAGRANTFILE_API_VERSION= "2"
Vagrant.configure("2") do |config|

  config.vm.define :saltmaster1 do |server|
    server.vm.box = "puppetlabs/centos-6.6-64-puppet"
    config.ssh.insert_key = false
    server.vm.network "private_network", ip: "192.168.0.20", virtualbox__intnet: true
    server.vm.hostname = "saltmaster1"

    config.vm.synced_folder "./salt/", "/srv/salt"
    config.vm.synced_folder "./pillar/", "/srv/pillar"

    server.vm.provision "shell", path: "./scripts/salt_minion_install.sh"
    server.vm.provision "shell", path: "./scripts/salt_master_install.sh"
    server.vm.provision "shell", path: "./scripts/setup_ext_pillar.sh"
  end

#    config.vm.define :saltminion do |server|
#    server.vm.box = "puppetlabs/centos-6.6-64-puppet"
#    config.ssh.insert_key = false
#    server.vm.network "private_network", ip: "192.168.0.31", virtualbox__intnet: true
#    server.vm.hostname = "saltminion"
#
#    server.vm.provision "shell", path: "./scripts/salt_minion_install.sh"
#  end
end
