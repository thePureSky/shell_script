#!/bin/bash

echo "The script name is:$0"
echo "The number of parameter is:$#"
[ "$#" -lt 2 ] && echo "The number of parameter is less than 2. Stop here."\
		&& exit 0
echo "Your whole parameter is: '$@'"
echo "The first parameter is: $1"
echo "The second parameter is: $2"
