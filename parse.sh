#!/bin/bash

#Daehyun Kim
#CSE374 Hw2
#Second Part

# extracts URLS from an input html and writes them into a text file

if [ $# -lt 2 ]; then
    echo "usage: $0 INPUT_FILE OUTPUT_FILE" 1>&2
    exit 1
fi

if [ ! -e $1 ]; then
    echo "Input file does not exist" 1>&2
    exit 1
fi

tmp=$(mktemp)
grep -i "http://" $1 | sed -r -e 's#^.*(http://)(.*)$#\1\2#g' | sed -r -e 's#^(http://.*)".*$#\1#g' > $tmp
grep -vwE 'babelfish|100bestwebsites|en.wikipedia.org' $tmp > $2
rm -f $tmp
