# Share ssh keys for using git on guest
Vagrant.configure("2") do |config|
    dir = File.dirname(__FILE__)
    config.vm.synced_folder "#{Dir.home}/.ssh/", "/home/vagrant/.ssh/"
    config.vm.synced_folder "#{Dir.home}/.ssh/", "/root/.ssh/", owner: "root", group: "root"
    system("ssh-keygen -y -f #{dir}/.vagrant/machines/default/virtualbox/private_key >> ~/.ssh/authorized_keys")
end