# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  ## require needed plugins
  %w[
    vagrant-berkshelf
    vagrant-omnibus
    vagrant-cachier
  ].each { | plugin |
    Vagrant.require_plugin plugin
  }

  config.omnibus.chef_version = :latest
  config.vm.hostname = "go-env-berkshelf"
#  config.ssh.private_key_path = "~/.ssh/id_rsa"
#  config.ssh.forward_agent = true

  config.vm.box = "devbox-vagrant"

  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"

  config.vm.network :private_network, ip: "33.33.33.33"

  config.vm.network :forwarded_port, guest: 3000, host: 8080

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = { }
    chef.run_list = [
        "recipe[devbox::default]"
    ]
  end
end
