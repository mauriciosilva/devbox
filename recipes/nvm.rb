%w[
  apt
  build-essential
  git].each{ |recipe | include_recipe recipe }

package 'curl'

node.set['app_name']['git_repository'] = "https://github.com/creationix/nvm.git"
node.set['app_name']['git_revision']   = "master"
node.set['nvm']['install_location']    = '/opt/nvm'
node.set['node']['version']            = 'v0.10.26'

nvm_location = node['nvm']['install_location']

Chef::Log.debug " #{nvm_location} already exists? #{::File.exists?(nvm_location) }"

git nvm_location  do
  user 'root'
  group 'root'
  repository node[:app_name][:git_repository]
  revision node[:app_name][:git_revision]
  destination nvm_location
  action :sync
  not_if { ::File.exists?(nvm_location) }
end

template '/etc/profile.d/nvm.sh' do
  source 'nvm.sh.erb'
  mode 0755
end

bash "install_a_version_of_node" do 
  code  <<-EOF
    source /etc/profile.d/nvm.sh
    nvm install 0.10.26
  EOF
  only_if { ::File.exists?('/opt/nvm/nvm.sh') }
end




