#! /usr/bin/env bash
# An example of using a bash trap. Here, the trap is triggered
# when the script exits, deleting the directory "foo".

working=$PWD/foo

trap "rm -rf $working" EXIT

echo $working
if [ ! -d $working ]; then
    mkdir $working
fi

exit 0
