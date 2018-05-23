Vagrant.configure("2") do |config|
    puts "Configuring Ubuntu Desktop"
    config.vm.provision "shell", inline: <<-SHELL
        sudo apt-get update
        sudo apt-get upgrade -y
        config.vm.provision :shell, :inline => "sudo apt-get update"
        config.vm.provision :shell, :inline => "sudo apt-get install -y lightdm ubuntu-desktop"
        config.vm.provision :shell, :inline => "sudo dpkg --configure -a"
    SHELL
end