#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content "<h1>Hello, world!</h1>
  <h3>This is Brian's Apache server</h3>
  HOSTNAME: #{node['hostname']}<br>
  IPADDRESS: #{node['ipaddress']}<br>
  CPU: #{node['cpu']['0']['mhz']}<br>
  MEMORY: #{node['memory']['total']}<br>
"
end

service 'httpd' do
  action [ :enable, :start ]
end
