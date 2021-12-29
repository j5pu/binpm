#!/bin/sh

#
# repo_test.sh is a test library with one function repo_test_function
. helper.sh

#######################################
#    this is the description of function a with . and spaces   .
#######################################
repo_test_function() {
  for arg do
    case "${arg}" in
      --debug|--dry-run|--no-quiet|--quiet|--verbose|--warning|--white) parse "${arg}" ;;
      --*) fromman repo_test_function "$@" || exit 0
    esac
  done
}

if [ "$(basename "$0")" = 'repo_test.sh' ]; then
  for arg do
    case "${arg}" in
      --debug|--dry-run|--no-quiet|--quiet|--verbose|--warning|--white) parse "${arg}" ;;
      --*) fromman "$0" "$@" || exit 0
    esac
  done
fi
