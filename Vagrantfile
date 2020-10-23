
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box_check_update = false
  config.vm.provider 'virtualbox' do |vb|
   vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
  end
  $num_instances = 2
  (1..$num_instances).each do |i|
    config.vm.define "27e2dfe262d0530a3b3d969b44425e3a#{i}" do |node|
      node.vm.box = "file://builds/virtualbox-debian.10.6.2.box"
      node.vm.hostname = "27e2dfe262d0530a3b3d969b44425e3a#{i}"
      node.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: 'en0: Wi-Fi (Wireless)', ip: "172.16.75.1#{i}"
      # node.vm.provision "shell", run: "always", inline: "ntpdate ntp.api.bz"
      node.vm.network "private_network", ip: "11.11.11.1#{i}"
      node.vm.provision "shell", run: "always", inline: "echo hello from 27e2dfe262d0530a3b3d969b44425e3a#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = 4096
        vb.cpus = 2
        vb.name = "27e2dfe262d0530a3b3d969b44425e3a#{i}"
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
        # cpu 使用率50%
        vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
      end
    end
  end
end
