# -*- mode: ruby -*-
# vi: set ft=ruby :

log_level = :info

chef_run_list = %w[
  runit
  kibana_auth
  kibana
]

chef_json = {
  'nginx'  => {
    'default_site_enabled' => false
  }
}

Vagrant.configure('2') do |config|

  # Common Settings
  #config.omnibus.chef_version = 'latest'
  config.vm.hostname = 'chef-kibana-auth'
  config.vm.network  :private_network, ip: '192.168.200.50'
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
  config.vm.provider :lxc do |lxc|
    lxc.customize 'cgroup.memory.limit_in_bytes', '1024M'
  end

  config.vm.define :lucid64 do |dist_config|
    dist_config.vm.box       = 'lucid64-rvm-chef11'
    # dist_config.vm.box       = 'opscode-ubuntu-10.04'
    # dist_config.vm.box_url   = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-10.04_provisionerless.box'

    dist_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ['/tmp/logstash-cookbooks']
      chef.provisioning_path = '/etc/vagrant-chef'
      chef.log_level = log_level
      chef.run_list = chef_run_list
      chef.json = chef_json
    end
  end
end
