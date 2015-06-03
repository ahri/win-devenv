#!/bin/sh

kill_agent=0
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent`
    kill_agent=1
fi

set -ue

ssh-add
vagrant up

if [ $kill_agent -eq 1 ]; then
    kill $SSH_AGENT_PID
fi
