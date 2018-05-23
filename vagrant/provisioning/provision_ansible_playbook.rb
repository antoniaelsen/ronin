Vagrant.configure("2") do |config|
    config.vm.provision "ansible_local" do |ansible|
        # TODO(aelsen): decouple mac addresses from main Vagrantfile
        mac_addresses = @interfaces.pluck(:mac)

        if File.file?('ansible_playbooks.rb')
        require './ansible_playbooks'
        end
        if ! defined? @ansible_playbooks
            @ansible_playbooks = []
        end

        @ansible_playbooks.each do |playbook|
            ansible.playbook = playbook[:playbook_path]
            ansible.galaxy_role_file = playbook[:galaxy_role_path]
            ansible.verbose = "-vvv"
            ansible.sudo = true
        
            # TODO(aelsen): parse extra vars from ansible_playbooks.rb
            ansible.extra_vars = {
                vm: true,
                username: "vagrant",
                ethercat_source_directory: "/home/vagrant/ethercat/",
                ethercat_mac_addresses: mac_addresses.size ? mac_addresses : nil
            }
        end
    end
end