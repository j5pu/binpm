#!/bin/sh


####################################### Executed
#
if [ "$(command -p basename "$0")" = 'profile.sh' ]; then
  for arg do
    case "${arg}" in
      --desc|--help|--manrepo|--version) COMMAND="$0" parse-man "${arg}" ;;
    esac
    exit
  done
fi
