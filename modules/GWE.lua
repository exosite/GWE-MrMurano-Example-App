local GWE = {}

function GWE.getDiskUsage(content)
	substr = content

	--Loop until "uname" string is before next "/"
	--Output disk usages

	--Device Disk Usage Info Container
	disk_usage ={}

	i = 0
	while string.find(substr,"uname") > string.find(substr,"/") and  string.find(substr,"uname") ~= nil do
		--Line of data storage
		disk_usage[i] = {}
		

		--FileSystem
		temp = string.find(substr,"\\n")
		substr = string.sub(substr,temp)
		temp = string.find(substr,"%s")
		file_system = string.sub(substr,3,temp)
		disk_usage[i][0] = file_system

		--Blocks
		substr = string.sub(substr,temp + 1)
		temp = string.find(substr,"%s")
		blocks = string.sub(substr,0,temp)
		disk_usage[i][1] = blocks

		--Used
		substr = string.sub(substr,temp + 1)
		temp = string.find(substr,"%s")
		used = string.sub(substr,0,temp)
		disk_usage[i][2] = used

		--Available
		substr = string.sub(substr,temp + 1)
		temp = string.find(substr,"%s")
		available = string.sub(substr,0,temp)
		disk_usage[i][3] = available

		--%Used
		substr = string.sub(substr,temp + 1)
		temp = string.find(substr,"%s")
		percent_used = string.sub(substr,0,temp)
		disk_usage[i][4] = percent_used

		--Mounted On
		substr = string.sub(substr,temp + 1)
		temp = string.find(substr,"\\n") -1
		--conditional for last element
		if temp  > string.find(substr,"uname") then
			temp = string.find(substr,"\"") - 1
			mounted_on = string.sub(substr,0,temp)
			break
		end
		mounted_on = string.sub(substr,0,temp)
		disk_usage[i][5] = mounted_on
		i = i + 1
	end

	return disk_usage

end

function GWE.getIPAddress(content)
	temp = string.find(content,"ipaddrs") + 9
	substr = string.sub(content,temp)
	temp = string.find(substr,"%[") + 1
	substr = string.sub(substr,temp)
	temp = string.find(substr,"%]") - 2
	ipaddress = string.sub(substr,2,temp)
	return ipaddress
end

function GWE.getUname(content)
	temp = string.find(content, "uname") + 9
	substr = string.sub(content,temp)
	temp = string.find(substr,"\"") + 1
	subsr = string.sub(substr,temp)
	temp = string.find(substr,"\"") - 1
	uname = string.sub(substr,0,temp)
	return uname
end

function GWE.getEngineReport(content)

end

function GWE.getUsageReport(content)

end