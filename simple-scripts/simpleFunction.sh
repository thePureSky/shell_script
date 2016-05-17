#!/bin/bash

function printit() {
	echo "Your choice is $1"
}

echo "This program will print your selection!"
case $1 in
	"one")
		printit 1
		;;
	"two")
		printit 2
		;;
	"three")
		printit 3
		;;
	*)
		echo -n "Usage $0 "
		echo "{one|two|three}"
		;;
esac

