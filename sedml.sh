# Copyright (C) 2015-2016 Myriam Leggieri <iammyr@email.com>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# Thanks to Austin Matzko for providing the core of this script in his blog post at
# http://austinmatzko.com/2008/04/26/sed-multi-line-search-and-replace/

#!/bin/sh
echo "***Multi-line sed***"
echo ""
echo ""
USAGE="Usage: $0 <input file> <sed argument, e.g., s/a/b/g> <output file>"

check_args(){
   if [ $1 -lt $2 ]; then
	echo $USAGE
  	exit 2;
   fi
}

start(){
	# change the input file if no 3rd argument
	if [ -z "$3" ]; then
	        outputfile="$1"
	else
        	outputfile="$3"
	fi
	sed -n '
	# if the first line copy the pattern to the hold buffer
	1h
	# if not the first line then append the pattern to the hold buffer
	1!H
	# if the last line then ...
	$ {
        	# copy from the hold to the pattern buffer
	        g
        	# do the search and replace
	        '"$2"'
        	# print
	        p
	}
	' $1 > $1.tmp;
	mv -f $1.tmp $outputfile;
}

check_args $# 3
start $1 $2 $3
