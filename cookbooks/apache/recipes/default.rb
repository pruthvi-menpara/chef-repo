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

#loop for attribute variables
node["apache"]["sites"].each do |site_name, site_data|
document_root = "/var/www/html/#{site_name}"

template "/etc/httpd/conf.d/#{site_name}.conf" do
	source "source.erb"
	mode "0644"
	variables(
		:document_root => document_root,
		:port => site_data["port"]
	)
	notifies :restart, "service[httpd]"
end

directory document_root do
	mode "0755"
	recursive true
end

template "#{document_root}/index.html" do
	source "index.html.erb"
	mode "0644"
	variables(
		:site_name => site_name,
		:port => site_data["port"]
	)	
end
end

# Service Start and Enable
service "httpd" do
	action [:enable, :start]
end
