# Pull in the list of shared directories
Vagrant.configure("2") do |config|
    if File.file?('shared_directories.rb')
    require './shared_directories'
    end
    if ! defined? @shared_directories
        @shared_directories = []
    end

    # Share all specified folders
    @shared_directories.each do |shared|
        config.vm.synced_folder shared[:host_path], shared[:guest_path], owner: shared[:owner], group: shared[:group]
    end
end