#!/bin/bash

#Daehyun Kim
#CSE374 Hw2
#First Part

#This script takes a URL as an argument and outputs the size of the page in bytes

if [ $# -eq 0 ] 
then 
    echo "usage: $0 FILE" 1>&2
    exit 1
fi

tmp_out=$(mktemp)
wget -q --tries=3 --timeout=1 --output-document=$tmp_out "$1"

if [ ! $? -eq 0 ]; then
    echo "0"
else 
wc -c < $tmp_out
fi

rm -f $tmp_out
