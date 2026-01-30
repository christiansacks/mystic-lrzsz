# sz-wrapper.sh

## code with comments

```bash
# Enable debug mode so any useful information is logged
DEBUG=true

debug(){
    # if debug mode is active
    if $DEBUG; then

        # output the 1st argument passed to the function into the log file
        echo "Debug: $1" >> /tmp/sz-wrapper.log

    fi
}

# iterate over the cli argument(s) passed to the script
for ITEM in "$@"; do

    # if debug mode is enabled, output this text to debug
    debug "ITEM=[$ITEM]"

    # If $ITEM is a file, and it's a .lst file and readable → treat as a list
    if [[ -f "$ITEM" && "$ITEM" == *.lst ]]; then

        # iterate of each filename inside the list $ITEM
        for FILE in $(cat $ITEM); do

	    # if debug mode is enabled, output this text to debug
	    debug "FILE=[$FILE]"

	    # initiate the send function (arguments explained below)
	    /usr/bin/sz -bpT -t 10 -w 8192 -8 $FILE 2>>/tmp/sz-wrapper.err

    done

    # Otherwise → treat ITEM as a direct file
    else
    
        # if debug mode is enabled, output this text to debug
        debug "FILE=[$ITEM]"

        # initiate the send function (arguments explained below)
        /usr/bin/sz -bpT -t 10 -w 8192 -8 "$ITEM" 2>>/tmp/sz-wrapper.err
    fi
done
```

### send function arguments explained

	Flag				Meaning
	-=-=				-=-=-=-

	-b				binary transfer
	-p				protect existing destination file (Z)
	-T				turbo mode
	-t 10				timeout in tenths of a second (10 = 1 second)
	-w 8192				limit the transmit window size to N bytes (ZMODEM)
	-8				try to go upto 8KB blocksize
	$FILE				the filename being passed to the program to send to the client
	2>>/tmp/sz-wrapper.err		redirect stderr to /tmp/sz-wrapper.err and append
