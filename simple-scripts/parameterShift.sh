#!/bin/bash

echo "The script name is:$0"
echo "The number of parameter is:$#"
[ "$#" -lt 2 ] && echo "The number of parameter is less than 2. Stop here."\
		&& exit 0
echo "Your whole parameter is: '$@'"
shift
echo 'after shift'
echo "Your whole parameter is: '$@'"
