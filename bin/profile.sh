#!/bin/sh

#
# System profile

####################################### Executed
#
if [ "$(command -p basename "$0")" = 'profile.sh' ]; then
  fromman "$0" "$@" || exit 0
fi
