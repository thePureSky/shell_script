#!/bin/bash
# let; (()); []

echo only for integer:
# let
no1=4
no2=5
echo "no1:$no1"
echo "no2:$no2"
let result=no1+no2
echo $result
let no1++
let no2--
echo "no1:$no1"
echo "no2:$no2"
let no1+=6
let no2-=6
echo "no1:$no1"
echo "no2:$no2"

# [] $ can be added or not
echo "[]"
no1=4
no2=5
result=$[ no1 + no2 ]
echo $result
result=$[ $no1 + 5 ]
echo $result

# (()) $ must be added? NO!!
echo "(())"
no1=4
no2=5
result=$(( $no1 + 5 ))
echo $result
result=$(( no1 + 5 ))
echo $result

# expr
echo "expr"
result=`expr 3 + 4`
echo $result
result=$(expr $no1 + $no2)
echo $result

echo using bc to calculate float operation:
#bc
echo "4 * 0.56" | bc

no=54
result=`echo "$no * 1.5" | bc`
echo $result

# scale
test=`echo "scale=2;3/8" | bc`
echo $test
result=`echo "$test + 1" | bc`
echo $result

# base transformation
no=100
echo "obase=2;$no" |bc
no=1100100
echo "obase=10;ibase=2;$no"|bc

# square or square root
echo "10^10" | bc
echo "sqrt(100)" | bc


