#!/usr/bin/env bash

# onchange is a script which listens for changes on the current directory and
# executes a given command each time such event is raised.

[ $# -eq 0 ] && {
    echo "Missing onchange command to execute"
    exit 1
}

wd=$(pwd)
if [ -n "`which inotifywait`" ]; then
    listener="inotifywait -q -e modify -r"
    listenercomplete="${listener} ."
elif [ "`which wait_on`" ]; then
    subdirs=$(find ${wd} -type d ! -path '*.svn*')
    listener="wait_on"
    listenercomplete="${listener} ${subdirs}"
else
    echo "Missing directory changes listener."
    echo "Please install one of inotify-tools (Linux) or wait_on (FreeBSD)."
    exit 1
fi

while :; do
    echo "> ${listener} ${wd}" && ${listenercomplete} > /dev/null
    echo "> $@" && eval $@
    echo
done
