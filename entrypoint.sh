#!/bin/bash

cmd=$1
shift

if [[ "$cmd" != "" ]]; then
    # if first arg is an executable then run it
    if [[ -x $cmd ]]; then
        exec $cmd $@
    else
        # search $PATH for $cmd
        for dir in ${PATH//:/ }; do
            if [[ -x "$dir/$cmd" ]]; then
                exec "$dir/$cmd" $@
            fi
        done
    fi
fi

exec python ./hblink.py $cmd $@
