#
# Cookbook Name:: chef-kibana_auth
# Recipe:: overrides
#
# Copyright (C) 2014 Twiket LTD
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Override kibana cookbook attributes on default level,
# we win due to higher priority of default files attributes.

if ['kibana', 'kibana::default'].any? {|r| run_context.loaded_recipe?(r)}
  Chef::Log.error "Recipe kibana::default must be included into the run_list only after kibana_auth"
  Chef::Log.error "Wrapping attributes failed"
  raise RuntimeError, "wrong run_list order"
end

kibana = node.default['kibana']
kibana['install_type']  = 'git'
kibana['webserver'] = 'nginx'
kibana['git']['branch'] = 'v3.0.0'
kibana['nginx']['template_cookbook'] = 'kibana_auth'
kibana['config']['panel_names'] = [
  'histogram', 'map', 'goal', 'table', 'filtering', 'timepicker', 'text', 'hits',
  'column', 'trends', 'bettermap', 'query', 'terms', 'stats', 'sparklines'
]
