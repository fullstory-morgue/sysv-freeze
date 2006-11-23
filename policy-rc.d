#!/bin/bash
#
# policy-rc.d - Überprüft, ob das ändern des Startverhaltens eines Dienstes erlaubt ist
#
# Autor: Andreas Loibl <andreas@andreas-loibl.de>
# http://www.andreas-loibl.de
#

FROZEN_FILE="/etc/frozen-rc.d"
QUIET=

if [ "$1" = "--quiet" ]; then
    QUIET=1
    shift
fi

if [ "$1" = "--list" ]; then
    shift
    if [ "$1" ]; then
        echo -n "$1 allowed: "
        if [ ! -f "$FROZEN_FILE" ]; then
            echo "yes"
            exit 0
        fi
        egrep -q " $1 " "$FROZEN_FILE"
        if [ $? -ne 0 ]; then
            echo "no"
            exit 101
        else
            echo "yes"
            exit 0
        fi
    else
        [ ! $QUIET ] && echo "$0: syntax error" 1>&2
        exit 103
    fi
    shift
fi

if [ ! "$1" ]; then
    [ ! $QUIET ] && echo "$0: syntax error" 1>&2
    exit 103
fi

[ ! -f "$FROZEN_FILE" ] && exit 0

egrep -q "^$1$" "$FROZEN_FILE" && exit 0

exit 101

