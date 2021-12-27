#!/usr/bin/env bats


setup() {
  load helpers/test_helper
}

@test "psargs " {
  . helper.sh
  run psargs
  [ "$status" -eq 0 ]
  assert_line --regexp "^bash"
}
