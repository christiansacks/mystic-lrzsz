# rz-wrapper.sh

`/usr/bin/rz -bCErRZq --o-sync 2>>/tmp/rz-wrapper.err`

## Flags and explanation

	Flag				Meaning
	-=-=				-=-=-=-
	
	-b				binary transfer
	-C				allow execution of remote commands (Z)
	-E				rename any files already existing
	-r				try to resume interrupted file transfers (Z)
	-R				restricted, more secure mode
	-Z				use ZMODEM protocol
	-q				quiet, no progress reports
	--o-sync			open output file(s) in synchronous write mode
	
	2>>/tmp/rz-wrapper.err		redirect stderr to /tmp/rz-wrapper.err and append
