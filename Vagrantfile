# Helper function to pluck item from an array
class Array
    def pluck(key)
        map {|h| h[key]}
    end
end

#Vagrant Box and Configuration
Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-16.04"

    # Allow external access to this guest
    config.vm.network "public_network"
    config.ssh.forward_agent = true
    config.ssh.forward_x11 = true
end

# Vagrantfiles - Setup
vagrantfiles_setup = Dir["vagrant/setup/*"]
vagrantfiles_provisioning = Dir["vagrant/provisioning/*"]
vagrantfiles_setup.each do |vagrantfile|
    print "- Loading ", vagrantfile,"\n"
    load File.expand_path(vagrantfile) if File.exists?(vagrantfile)
end

# Virtualbox
Vagrant.configure("2") do |config|
    config.vm.provider "virtualbox" do |vb|
        vb.name = "ronin"
        vb.memory = 8192
        vb.cpus = 4
        vb.gui = true
        vb.customize ["modifyvm", :id, "--vram", "128"]
    end
end

# Vagrantfiles - Provisioning
vagrantfiles_provisioning.each do |vagrantfile|
    load File.expand_path(vagrantfile) if File.exists?(vagrantfile)
end
