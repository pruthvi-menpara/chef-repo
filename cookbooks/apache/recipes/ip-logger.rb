search("node", "*:*").each do |search|

	log"System IP address is #{search["ipaddress"]} / System Platform is #{search["platform"]}"

end
