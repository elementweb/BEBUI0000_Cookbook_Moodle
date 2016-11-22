#
# Cookbook Name:: cookbook_moodle
# Recipe:: symlinks
#

# Since Vagrant on an NTFS host doesn't support symlinks properly,
# We decided to move the node_modules and tmp directory off the shared disk.

# Create a folder to store the symlinked directories

if !node['cookbook_moodle']['symlinks'].empty? 
  symlinked_folder = ::File.join(node['appbox']['apps_dir'], node['cookbook_moodle']['appname'], 'symlinks')
  directory symlinked_folder do
    owner 'vagrant'
    group 'vagrant'
    action :create
    recursive true
  end

  # Loop through the symlniks. They need to be relative to the project folder, and they link to the symlink folder above.
  Array(node['cookbook_moodle']['symlinks']).each_with_index do |relative_folder, index|

    # Deduce the two locations
    source_folder = ::File.join(node['appbox']['apps_dir'], node['cookbook_moodle']['appname'], 'current', relative_folder)
    destination_folder = ::File.join(symlinked_folder, relative_folder)

    # Ensure the source folder doesn't exist
    directory source_folder do
      recursive true
      action :delete
      not_if "test -dL #{source_folder}"
    end

    # Ensure the destination folder does exist
    directory destination_folder do
      owner 'vagrant'
      group 'vagrant'
      action :create
      recursive true
    end

    # Create the symbolic link
    link source_folder do
      owner 'vagrant'
      group 'vagrant'
      to destination_folder
      not_if "test -d #{source_folder}"
    end

  end
end 