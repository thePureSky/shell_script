#!/bin/bash

read -p "Please input (Y/N): " yn
[ "$yn" == "Y" -o "$yn" == "y" ] && echo "OK, continue" && exit 0
[ "$yn" == "n" -o "$yn" == "N" ] && echo "Oh, interupt" && exit 0

echo "I don't know what your choice is" && exit 0
