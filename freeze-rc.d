#!/bin/bash
#
# freeze-rc.d - Freezes the current rc.d-Configuration (see also unfreeze-rc.d)
#
# Author: Andreas Loibl <andreas@andreas-loibl.de>
# http://www.andreas-loibl.de
#

FROZEN_FILE="/etc/frozen-rc.d"

if [ $(id -u) -ne 0 ]; then
    echo "Error: You must be root to run this script!"
    exit 1
fi

LIST=$(find /etc/rc*.d/ -name "S*" -printf "%f ")
for SERVICE in $LIST
do
LIST_STARTED_SERVICES="$LIST_STARTED_SERVICES
${SERVICE:3}"
done

echo "$LIST_STARTED_SERVICES" | sort | uniq | sed '/^$/d' > "$FROZEN_FILE"

exit 0

