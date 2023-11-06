# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
    :frontServer => {
        :box_name => "generic/centos8",
        :ip_addr => '192.168.77.10',
        :cpus => 1,
        :memory => 256,
        :playbooks_name => "nginx",
    },
    :serverDNS => {
        :box_name => "criptobes3301/ubuntu-20.04",
        :ip_addr => '192.168.77.11',
        :cpus => 1,
        :memory => 512,
        :playbooks_name => "dns",
    },
    :monitoringServer => {
        :box_name => "criptobes3301/ubuntu-20.04",
        :ip_addr => '192.168.77.12',
        :cpus => 1,
        :memory => 512,
        :playbooks_name => "monitoring",
    },
    :logServer => {
        :box_name => "criptobes3301/ubuntu-20.04",
        :ip_addr => '192.168.77.13',
        :cpus => 1,
        :memory => 512,
        :playbooks_name => "logs",
    },
    :applicationServer => {
        :box_name => "generic/centos8",
        :ip_addr => '192.168.77.14',
        :cpus => 1,
        :memory => 256,
        :playbooks_name => "nginx",
    },
    :applicationSlave => {
        :box_name => "generic/centos8",
        :ip_addr => '192.168.77.15',
        :cpus => 1,
        :memory => 256,
        :playbooks_name => "nginx",
    },
    :dataBaseServer => {
        :box_name => "generic/centos8",
        :ip_addr => '192.168.77.16',
        :cpus => 1,
        :memory => 256,
        :playbooks_name => "nginx",
    },
    :dataBaseSlave => {
        :box_name => "generic/centos8",
        :ip_addr => '192.168.77.17',
        :cpus => 1,
        :memory => 256,
        :playbooks_name => "nginx",
    },

}

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
      config.vm.define boxname do |box|
          box.vm.box = boxconfig[:box_name]
          box.vm.host_name = boxname.to_s + ".security.lab"
          
          if boxname.to_s == 'monitoringServer'
            box.vm.network "forwarded_port", guest: 9090, host: 9090
            box.vm.network "forwarded_port", guest: 3000, host: 3000 
            box.vm.network "forwarded_port", guest: 9100, host: 9100 
          end

          box.vm.network "private_network", ip: boxconfig[:ip_addr], virtualbox__intnet: "DMZ"
          box.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbooks/" + boxconfig[:playbooks_name] + ".yml"
          end
          box.vm.provider :virtualbox do |vb|
            vb.memory = boxconfig[:memory]
            vb.cpus = boxconfig[:cpus] 	        
          end
      end
  end
end
