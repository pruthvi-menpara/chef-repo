#
# Cookbook:: user
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "user::group"

search("user", "*:*").each do |user_data|

	user user_data["id"] do
		comment user_data["comment"]
		uid user_data["uid"]
		home user_data["home"]
		manage_home user_data["manage_home"]
		shell user_data["shell"]
 	end

end
