#!/bin/bash

command -v jq >/dev/null 2>&1 || { echo >&2 "Install jq first"; exit 1; }

source "$HOME/lgtv-venv/bin/activate"

jq_cmd() {
    jq --raw-output "$@"
}

exec_lgtv() {
    response="$(lgtv --name MyTV --ssl "$@" | head -n 1 )"
    if [ "$(echo "$response" | jq_cmd .type)" == "error" ]; then
        echo "$response" | jq_cmd .error
        exit 1
    fi

    echo "$response"
}

exec_lgtv $@