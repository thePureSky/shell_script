#!/bin/bash

# print
echo Hello world !
echo 'Hello world !'
echo "Hello world \!" # ! should be noticed

printf "%-5s %-10s %-4s\n" 1 Sarath 80.3456

# \
echo -e "1\t2\t3"

# color: text and background
echo -e "\e[1;31m \e[1;42m Green Background and red text \e[0m"
