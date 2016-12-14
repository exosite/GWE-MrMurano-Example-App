--#ENDPOINT GET /usage_report
local result = Keystore.get({ key = "usage_report" })
response.code = 201
response.message = {result}
response.headers["x-my-custom-header"] = "my header content"
