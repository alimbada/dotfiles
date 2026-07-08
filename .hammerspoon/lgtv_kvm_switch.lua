require "lgtv_control"

local TARGET_VENDOR_ID  = 1115  
local TARGET_PRODUCT_ID = 521


function lgtv_current_app_id()
  local foreground_app_info = exec_command("getForegroundAppInfo")
  for w in foreground_app_info:gmatch('%b{}') do
    if w:match('\"response\"') then
      local match = w:match('\"appId\"%s*:%s*\"([^\"]+)\"')
      if match then
        return match
      end
    end
  end
end


function switch_input(is_connected)
    if is_connected then
        -- print("Target USB Device Connected!")
         local app_id = "com.webos.app."..my_input:lower():gsub("_", "")

        if lgtv_current_app_id() ~= app_id then
            exec_command("setInput "..my_input)
        end
    -- else
        -- print("Target USB Device Disconnected!")
    end
end


usbWatcher = hs.usb.watcher.new(function(data)
    if data.vendorID == TARGET_VENDOR_ID and data.productID == TARGET_PRODUCT_ID then
        if data.eventType == "added" then
            switch_input(true)
        elseif data.eventType == "removed" then
            switch_input(false)
        end
    end
end)


usbWatcher:start()
