#!/usr/bin/env bats

setup() {
  load helpers/test_helper
  . helper.sh
}

@test "parse" {
  run parse-output --debug --dry-run --quiet --verbose --warning --white
  assert_success
  assert_output - <<STDIN
DEBUG: 1
DRY_RUN: 1
QUIET: 1
VERBOSE: 1
WARNING: 1
WHITE: 1
STDIN
}

@test "parse --no-quiet" {
  run parse-output --debug --dry-run --no-quiet --verbose --warning --white
  assert_success
  assert_output - <<STDIN
DEBUG: 1
DRY_RUN: 1
QUIET: 0
VERBOSE: 1
WARNING: 1
WHITE: 1
STDIN
}
