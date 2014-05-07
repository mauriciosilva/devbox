include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'git'

node.set[:app_name][:git_repository] = "https://github.com/creationix/nvm.git"
node.set[:app_name][:git_revision] = "master"

nvm_location = node['nvm']['install_location']

package 'curl'

execute 'source-nvm' do 
  command <<-eof
    echo 'source /opt/nvm/nvm.sh' >> /etc/profile
  eof
  notifies :run, 'execute[install-node-ver-]'
#  action :nothing
end

Chef::Log.info "ver is #{node['node']['version']}"
execute "install-node-ver-" do 
  Chef::Log.info "install a node version"
  command <<-eof
    source /etc/profile
    nvm install v0.10.24
  eof
  action :nothing
end

Chef::Log.info " *** does it #{::File.exists?(nvm_location) }"

git nvm_location  do
  user 'vagrant'
  group 'vagrant'
  repository node[:app_name][:git_repository]
  revision node[:app_name][:git_revision]
  destination nvm_location
  action :sync
  notifies :run, 'execute[source-nvm]'
  not_if { ::File.exists?(nvm_location) }
end




