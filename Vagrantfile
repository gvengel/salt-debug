Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"
  config.vm.define "master", primary: true do |master|
    master.vm.host_name = "master"
    master.vm.synced_folder "salt/", "/srv/salt"
    master.vm.synced_folder "pillar/", "/srv/pillar"
    master.vm.network "private_network", ip: "192.168.137.11"
    master.vm.provision :salt do |salt|
      salt.run_highstate = false
      salt.install_master = true
      salt.master_config = "cfg/master"
      salt.minion_config = "cfg/minion"
      salt.master_key = "pki/master.pem"
      salt.master_pub = "pki/master.pub"
      salt.minion_key = "pki/master.pem"
      salt.minion_pub = "pki/master.pub"
      salt.seed_master = {
        "master" => "pki/master.pub",
        "minion" => "pki/minion.pub",
      }
    end
    master.vm.provision "shell", inline: "salt-call state.apply"
  end
  config.vm.define "minion" do |minion|
    minion.vm.host_name = "minion"
    minion.vm.network "private_network", ip: "192.168.137.12"
    minion.vm.provision :salt do |salt|
      salt.run_highstate = false
      salt.minion_config = "cfg/minion"
      salt.minion_key = "pki/minion.pem"
      salt.minion_pub = "pki/minion.pub"
    end
  end
end
