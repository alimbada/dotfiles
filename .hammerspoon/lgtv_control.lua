local lgtv_path = "~/lgtv-venv/bin/lgtv" -- Full path to lgtv executable
local tv_name = "MyTV" -- Name of your TV, set when you run `lgtv auth`
local lgtv_cmd = lgtv_path.." --ssl --name "..tv_name

local my_input = "HDMI_3"
local other_input = "HDMI_4"

function exec_command(command)
    command = lgtv_cmd .. " " .. command
    -- print("Executing command: " .. command)

    response = hs.execute(command)
    -- print(response)

    return response
end

hs.hotkey.bind({"cmd", "shift", "ctrl"}, "1", function()
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
