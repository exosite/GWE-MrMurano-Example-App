--#EVENT device datapoint
local hack = to_json(data)
local rdata = from_json(hack)

local alias = rdata.alias
local payload = {}
local data = rdata.value[2]

if alias == "device_info" then
  
  Keystore.set({ key = "device_info", value = data })
end

if alias == "usage_report" then
  Keystore.set({ key = "usage_report", value = data })
end

if alias == "engine_report" then
  Keystore.set({ key = "engine_report", value = data })
end

if alias == "test" then
  payload[alias] = data
  
  local q = nil
  if rdata.api == "write" then
    q = tostring(TSW.write("raw_data", {sn=tostring(rdata.device_sn), pid=rdata.pid}, payload))
  else
    q = tostring(TSW.write("raw_data", {sn=tostring(rdata.device_sn), pid=rdata.pid}, payload))
    Keystore.set({key="query", value=q})    
  end
  print(q)
  local r = Timeseries.write({query=q})
  print(r)
end  