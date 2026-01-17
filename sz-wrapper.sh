#!/usr/bin/env bash
DEBUG=true

debug(){
    if $DEBUG; then
        echo "Debug: $1" >> /tmp/sz-wrapper.log
    fi
}

for ITEM in "$@"; do
    debug "ITEM=[$ITEM]"

    # If it's a .lst file and readable → treat as a list
    if [[ -f "$ITEM" && "$ITEM" == *.lst ]]; then
        for FILE in $(cat $ITEM); do
	    debug "FILE=[$FILE]"
	    /usr/bin/sz -bpT -t 10 -w 8192 -8 $FILE 2>>/tmp/sz-wrapper.err
	done

    # Otherwise → treat ITEM as a direct file
    else
        debug "FILE=[$ITEM]"
        /usr/bin/sz -bpT -t 10 -w 8192 -8 "$ITEM" 2>>/tmp/sz-wrapper.err
    fi
done
