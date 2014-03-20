default['kibana']['auth']['repo']                     = 'https://github.com/dennybaa/kibana3_auth'
default['kibana']['auth']['branch']                   = 'master'
default['kibana']['auth']['git_action']               = 'checkout'
default['kibana']['auth']['private_dashboards']       = true
default['kibana']['auth']['webserver']                = 'puma'

default['kibana']['auth']['file_name']                = 'kibana.htpasswd'
default['kibana']['auth']['file_cookbook']            = 'kibana'
default['kibana']['auth']['file_path']                = "/etc/nginx/conf.d/#{::File.basename(node['kibana']['auth']['file_name'])}"
default['kibana']['auth']['bind']                     = '0.0.0.0'
default['kibana']['auth']['port']                     = 9292

default['kibana']['auth']['config']['kibana_root']    = 'kibana'
default['kibana']['auth']['config']['login_header']   = nil
default['kibana']['auth']['config']['logging']        = true
default['kibana']['auth']['config']['log_level']      = 'error'
default['kibana']['auth']['config']['session_domain'] = nil
default['kibana']['auth']['config']['session_expire'] = nil
default['kibana']['auth']['config']['session_secret'] = nil
default['kibana']['auth']['config']['auth_method']    = nil
default['kibana']['auth']['config']['auth_realm']     = nil
default['kibana']['auth']['config']['auth_file']      = "#{node['kibana']['auth']['file_path']}"
default['kibana']['auth']['config']['elasticsearch']  = nil

default['kibana']['auth']['gems'] = ['sinatra', 'htauth', 'puma']

override['kibana']['install_type']  = 'git'
override['kibana']['webserver'] = 'nginx'
override['kibana']['git']['branch'] = 'v3.0.0'
override['kibana']['nginx']['template_cookbook'] = 'kibana_auth'
override['kibana']['config']['panel_names'] = [
  'histogram', 'map', 'goal', 'table', 'filtering', 'timepicker', 'text', 'hits',
  'column', 'trends', 'bettermap', 'query', 'terms', 'stats', 'sparklines'
]
