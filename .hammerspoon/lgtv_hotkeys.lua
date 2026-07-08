require "lgtv_control"

local other_input = "HDMI_4"

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "1", function()
    exec_command("on")
    exec_command("setInput "..my_input)
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "2", function()
    exec_command("setInput "..other_input)
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "=", function()
    exec_command("on")
end)

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "-", function()
    exec_command("off")
end)
