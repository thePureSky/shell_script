#!/bin/bash

if [ "$1" == "hello" ]; then
	echo "$1, how are you?"
elif [ "$1" == "" ];then
	echo "Your must input the patameter, ex> {$0 someword}"
else
	echo "The only parameter is 'hello', ex> {$0 hello}"
fi
