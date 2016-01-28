#!/usr/bin/env bash
# For all ".cfg.tmpl" files, use `sed` to find and replace (with empty
# backup) all instances of "{SAVE_.*GRIDS}" and "{SAVE_.*PIXELS}" with
# "No".

all=`find ~/projects/component_metadata -name "*.cfg.tmpl"`
for file in $all; do
    sed -i '' 's@{SAVE_.*GRIDS}@No@g' $file
    sed -i '' 's@{SAVE_.*PIXELS}@No@g' $file
done

exit 0
