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

cookbook_file "/var/www/html/index.html" do
source node["apache"]["indexfile"]
mode "0644"
end

# Service Start and Enable

service "httpd" do
action [:enable, :start]
end
