#!/bin/bash

# test in ~\.bashrc file

prepend() { [ -d "$2" ] && eval $1=\"$2:\$$1\" && export $1; }

prepend T /home/leaf

echo $T

prepend1() { [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1; }

prepend1 D /home/leaf

echo $D

