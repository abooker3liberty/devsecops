Vagrant.configure("2") do |config|
  config.vm.define "devsecops-full"
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20200518.1.0"
  config.vm.synced_folder '.', '/vagrant'

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
    vb.memory = 4096
    vb.cpus = 4
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vb.name = "vagrant.devsecops.full"
  end

  config.vm.provision "shell", path: "bootstrap.sh"
end
