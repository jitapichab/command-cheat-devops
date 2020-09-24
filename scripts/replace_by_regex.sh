#!/bin/sh
for i in $(egrep -iR " update:" . | cut -d/ -f2 | cut -d: -f1)
do
    echo $i
	sed -i -E  's/ update:/ refresh:/g' $i
done