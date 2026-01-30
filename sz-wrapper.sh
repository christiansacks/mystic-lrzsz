#!/usr/bin/env bash
DEBUG=true

debug(){
    if $DEBUG; then
        echo "Debug: $1" >> /tmp/sz-wrapper.log
    fi
}

getFile(){
    FILE="$1"
    if file "$FILE" | grep -q 'text'; then
        MODE="-apT -t 10 -w 8192 -8"
    else
        MODE="-bpT -t 10 -w 8192 -8"
    fi
    /usr/bin/sz $MODE "$FILE" 2>>/tmp/sz-wrapper.err
}

for ITEM in "$@"; do
    debug "ITEM=[$ITEM]"

    # If it's a .lst file and readable → treat as a list
    if [[ -f "$ITEM" && "$ITEM" == *.lst ]]; then
        while IFS= read -r FILE; do
            debug "FILE=[$FILE]"
            getFile "$FILE"
        done < "$ITEM"

    # Otherwise → treat ITEM as a direct file
    else
        debug "FILE=[$ITEM]"
        getFile "$ITEM"
    fi
done
