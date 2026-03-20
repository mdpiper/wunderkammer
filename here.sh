#! /usr/bin/env bash
# Print the directory of the script (if not executed from the script's directory).

here="${0%/*}"
[ "${here}" == "." ] && here=${pwd}

echo "Here: ${here}"

exit 0
