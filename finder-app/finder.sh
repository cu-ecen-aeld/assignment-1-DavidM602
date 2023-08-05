#!/bin/bash

#check that args were passed
if [[ ! $# -eq 2 ]];
then
    echo "ERROR: usage -> finder <FILE_PATH> <STRING>"
    echo "Please enter a filename with path, and string to search for"
    exit 1
fi

#set arg variables
FILESDIR=$1
SEARCHSTR=$2

#check if the directory exists
if [ ! -d "$FILESDIR" ]
then
    echo "ERROR: unable to find the directory $FILESDIR"
    exit 1
fi

NUM_FILES=`find $FILESDIR -type f | wc -l`
NUM_LINES=`grep -r $SEARCHSTR $FILESDIR | wc -l`
echo "The number of files are $NUM_FILES and the number of matching lines are $NUM_LINES."

