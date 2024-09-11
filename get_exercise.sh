#!/bin/bash

# Usage message
if [ $# -lt 1 ]; then
    echo 1>&2 "Usage: $0 <exercise_num>"
    echo 1>&2 "e.g. $0 1 to check out exercise 1"
    exit 1
fi

# Activate agent and re-add the ssh key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/i2dl_ss2018

# Fetch from forced pushed git
git fetch origin
git reset --hard origin/master
git pull origin master
git submodule update --init -- exercise_$1

