#!/bin/bash
# @Function
# Find out the most cpu consumed threads of java, and print the stack trace of these threads.
#
# @Usage
# $ . /show-busy-java-threads -h
#

find . -name "*.jar" > /tmp/find_in_jar_temp
while read line
do
	if unzip -l $line | grep $1 &> /tmp/find_in_jar_temp_second
	then
		echo $line | sed 's#\(.*\)#\x1b[1;31m\1\x1b[00m#'
		cat /tmp/find_in_jar_temp_second 
	fi
done < /tmp/find_in_jar_temp
