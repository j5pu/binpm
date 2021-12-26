#!/bin/sh

#
# repo_test.sh is a test library with one function repo_test_function
. helper.sh

#######################################
# repo_test_function description
#######################################
repo_test_function() {
  for arg do
    case "${arg}" in
      --desc|--help|--manrepo|--version) COMMAND='repo_test_function' parse-man "${arg}"; exit ;;
      --debug|--dry-run|--no-quiet|--quiet|--verbose|--warning|--white) parse "${arg}" ;;
    esac
  done
}

if [ "$(basename "$0")" = 'repo_test.sh' ]; then
  for arg do
    case "${arg}" in
      --desc|--help|--manrepo|--version) COMMAND="${0##*/}" parse-man "${arg}"; exit ;;
      --debug|--dry-run|--no-quiet|--quiet|--verbose|--warning|--white) parse "${arg}" ;;
    esac
  done
fi
