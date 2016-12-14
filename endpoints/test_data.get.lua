--#ENDPOINT GET /test_data
local query_string =  "select test from raw_data order by time desc limit 100"
local data = Timeseries.query({
  q = query_string
})

response.code = 201
response.message = data.results
response.headers["x-my-custom-header"] = "my header content"
