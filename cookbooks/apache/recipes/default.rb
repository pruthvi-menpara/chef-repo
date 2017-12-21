#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# Install Package

package "httpd" do
action :install
end

# Create File

#cookbook_file "/var/www/html/index.html" do
#source node["apache"]["indexfile"]
#mode "0644"
#end

#Rename conf.d file
execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak" do
	only_if do File.exist?("/etc/httpd/conf.d/welcome.conf") end
	notifies :restart, 'service[httpd]'
end


# Service Start and Enable

service "httpd" do
action [:enable, :start]
end
