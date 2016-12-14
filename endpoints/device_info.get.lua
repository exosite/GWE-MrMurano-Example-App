--#ENDPOINT GET /device_info
local result = Keystore.get({ key = "device_info" })
response.code = 201
response.message = {result}
response.headers["x-my-custom-header"] = "my header content"
