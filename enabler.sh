#!/usr/bin/env bash
# For all ".in" files, use `sed` to find and replace (with backup)
# all instances of "{comp_status}" with "Enabled".

all=`find ~/projects/mdpiper/component_metadata -iname "*.in"`
for file in $all; do
    sed -i.foo  's@{comp_status}@Enabled      @' $file
done

exit 0
