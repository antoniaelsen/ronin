# Helper function to pluck item from an array
class Array
    def pluck(key)
        map {|h| h[key]}
    end
end

#Vagrant configuration
Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-16.04"

    # Allow external access to this guest
    config.vm.network "public_network"
    config.ssh.forward_agent = true
end

# Vagrantfiles
vagrantfiles_setup = Dir["vagrant/setup/*"]
vagrantfiles_provisioning = Dir["vagrant/provisioning/*"]
vagrantfiles_setup.each do |vagrantfile|
    print "- Loading ", vagrantfile,"\n"
    load File.expand_path(vagrantfile) if File.exists?(vagrantfile)
end

Vagrant.configure("2") do |config|
    config.vm.provider "virtualbox" do |vb|
        vb.name = "ronin"
        vb.memory = 4096
        vb.cpus = 2
        vb.gui = true
    end
end

vagrantfiles_provisioning.each do |vagrantfile|
    load File.expand_path(vagrantfile) if File.exists?(vagrantfile)
end
