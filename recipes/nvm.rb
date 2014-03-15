include_recipe 'git'

node.set[:app_name][:git_repository] = "https://github.com/creationix/nvm.git"
node.set[:app_name][:git_revision] = "master"

Chef::Log.info "#{Chef::Config[:file_cache_path]}"

nvm_location = '/home/vagrant/.nvm'

package 'curl'

execute 'install-nvm' do 
  command <<-eof
    echo 'source ~/.nvm/nvm.sh' >> /home/vagrant/.profile
  eof
  action :nothing
end

git nvm_location  do
  user 'vagrant'
  group 'vagrant'
  repository node[:app_name][:git_repository]
  revision node[:app_name][:git_revision]
  destination nvm_location
  action :sync
  notifies :run, 'execute[install-nvm]'

  not_if { ::File.exists?(nvm_location) }
end

