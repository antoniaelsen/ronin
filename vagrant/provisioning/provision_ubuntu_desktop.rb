Vagrant.configure("2") do |config|
    puts "Configuring Ubuntu Desktop"
    config.vm.provision "shell", inline: <<-SHELL
        sudo sh -c "echo 'set grub-pc/install_devices /dev/sda' | debconf-communicate"
        sudo apt-get update
        sudo apt-get upgrade -y
        sudo apt-get install -y lightdm ubuntu-desktop
        sudo dpkg --configure -a
    SHELL
end