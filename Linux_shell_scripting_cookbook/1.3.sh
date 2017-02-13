#!/bin/bash

#check twice using sudo or not

fruit=apple
echo "We have 5 ${fruit}s"
echo "We have 5 $fruit s"

export fruit

# length of varible
echo ${#fruit}

echo $SHELL

# check whether the user is root: UID of root is 0
if [ $UID -ne 0 ]; then
	echo Not root user. Please run as root.
else
	echo Root User.
fi
