# Pull in the list of interfaces for this host
Vagrant.configure("2") do |config|
    if File.file?('interfaces.rb')
    require './interfaces'
    end
    if ! defined? @interfaces
        @interfaces = []
    end

    # Create public interface for Ethercat
    @interfaces.each do |iface|
        config.vm.network "public_network",
            bridge: iface[:bridge],
            mac: iface[:mac].tr(':', ''),
            ip: iface[:ip],
            :netmask => "255.255.255.0"
    end
end