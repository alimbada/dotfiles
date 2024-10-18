#!/bin/bash

command -v jq >/dev/null 2>&1 || { echo >&2 "Install jq first"; exit 1; }

source "$HOME/lgtv-venv/bin/activate"

jq_cmd() {
    jq --raw-output "$@"
}

exec_lgtv(){
    response="$(lgtv --name MyTV --ssl "$@" | head -n 1 )"
    if [ "$(echo "$response" | jq_cmd .type)" == "error" ]; then
        echo "$response" | jq_cmd .error
        exit 1
    fi
    echo "$response"
}

APPID=$(exec_lgtv getForegroundAppInfo | jq --raw-output .payload.appId)

exec_lgtv startApp com.webos.app.homeconnect && sleep 6
exec_lgtv sendButton up up right enter && sleep 2
exec_lgtv sendButton enter && sleep 2

# number of `down`s here depends on the input ID; in this case I'm configuring HDMI 3
exec_lgtv sendButton down down down left enter && sleep 2

exec_lgtv sendButton down down down down down down down down down enter && sleep 2

# as noted above, number of `up`s here depends on input ID
exec_lgtv sendButton up up up right enter && sleep 2

exec_lgtv startApp "$APPID"

