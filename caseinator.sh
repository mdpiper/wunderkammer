#!/usr/bin/env bash
# For all "parameters.json" files, use `sed` to find and replace (in
# place) "Case5" with "June_20_67".

all=`find ~/projects/component_metadata -name "parameters.json"`
for file in $all; do
    sed -i '' 's@Case5@June_20_67@' $file
done

exit 0
