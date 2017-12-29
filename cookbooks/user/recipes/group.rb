#
# Cookbook:: user
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

search("group", "*:*").each do |group_data|

	group group_data["id"] do
		gid group_data["gid"]
		members group_data["members"]
 	end

end
