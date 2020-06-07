Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-20.04"
  #config.vm.box_version = "202005.21.0"
  config.vm.hostname = "osa-workshop-vm"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "osa-workshop-vm"
    vb.memory = 8192
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.gui = true
  end
    
  # Bridge VM network with a specific host network?
  #config.vm.network "public_network", bridge: 'eth0', :mac => "DEADBEEFFEED"
  # Or a private network?
  #config.vm.network "private_network", ip: "10.10.10.10"
 
  # Uncomment these if you'd like to copy your git config and private key
  # This is useful if you're planning on doing all your work inside this VM
  #config.vm.provision "file", source: "~/.ssh/id_rsa", destination: ".ssh/id_rsa"
  #config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"

  # Get the machine ready (install packages, move things around etc.)
  config.vm.provision :shell, path: "init-root.sh"
  config.vm.provision :shell, path: "init-user.sh", privileged: false
end
