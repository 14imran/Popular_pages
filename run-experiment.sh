#!/bin/bash

#Daehyun Kim
#CSE374 Hw2
#Third Part

# executes the script perform-measurement.sh on each URL inside the input file

if [ $# -lt 2 ]; then
    echo "usage: $0 INPUT OUTPUT" 1>&2
    exit 1
fi

if [ ! -e $1 ]; then
    echo "Error: "$1" does not exist"
    exit 1
fi

rank=1
>$2
while read line 
do
    echo "Performing measurement on $line..."
    size=$(./perform-measurement.sh $line)
    if [ $size -gt 0 ]; then
	echo "$rank $line $size" >> "$2"
	echo "...success"
    elif [ $size -eq 0 ]; then
	echo "...failed"
    fi
    ((rank++)) 

done < "$1"
