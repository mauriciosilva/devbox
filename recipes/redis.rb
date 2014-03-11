apt_repository 'redis-ppa' do
  uri 'http://ppa.launchpad.net/chris-lea/redis-server/ubuntu'
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key 'C7917B12'
end

package 'redis-server'
