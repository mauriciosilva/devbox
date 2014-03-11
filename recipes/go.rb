## install go
go_binary = '/usr/local/go/bin/go'

remote_file "#{Chef::Config[:file_cache_path]}/go1.2.linux-amd64.tar.gz" do 
  source "https://go.googlecode.com/files/go1.2.linux-amd64.tar.gz"
  not_if { ::File.exists?(go_binary) }
end

execute "install go" do 
  cwd Chef::Config[:file_cache_path] 

  Chef::Log.info("path #{Chef::Config[:file_cache_path]}")

  ## echo command must be done manually?
  command <<-EOF
    tar -C /usr/local -xzf go1.2.linux-amd64.tar.gz
    echo "'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile"
  EOF

  not_if { ::File.exists?(go_binary) }
end
