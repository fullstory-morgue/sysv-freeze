#!/bin/bash
#
# unfreeze-rc.d - Unfreezes the current rc.d-Configuration (see also freeze-rc.d)
#
# Author: Andreas Loibl <andreas@andreas-loibl.de>
# http://www.andreas-loibl.de
#

FROZEN_FILE="/etc/frozen-rc.d"

rm -f "$FROZEN_FILE"

exit 0

