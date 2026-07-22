local lgtv_path = "~/lgtv-venv/bin/lgtv" -- Full path to lgtv executable
local tv_name = "MyTV" -- Name of your TV, set when you run `lgtv auth`
local lgtv_cmd = lgtv_path.." --ssl --name "..tv_name

my_input = "HDMI_3"

function exec_command(command)
    command = lgtv_cmd .. " " .. command.. "&> /dev/null & disown"
    -- print("Executing command: " .. command)

    response = hs.execute(command)
    -- print(response)

    return response
end
