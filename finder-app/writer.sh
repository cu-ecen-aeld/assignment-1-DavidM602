#!/bin/bash

#check that args were passed
if [[ ! $# -eq 2 ]];
then
   echo "ERROR: usage -> writer <FILE_NAME> <STRING>"
   echo "Please enter a filename with the full path, and a string to write to the file."
   exit 1
fi

WRITEFILE=$1
WRITESTR=$2

FILE_NAME="$(basename $WRITEFILE)"
DIR_NAME="$(dirname $WRITEFILE)"

if [[ ! -d $DIR_NAME ]];
then
   mkdir -p $DIR_NAME
   if [[ ! $? ]];
   then
      echo "ERROR: Failed to create directory $DIR_NAME"
      exit 1
   fi
fi

echo $WRITESTR >$WRITEFILE

if [[ ! $? ]];
then
   echo "ERROR: Failed to write to $FILE_NAME"
   exit 1
fi
