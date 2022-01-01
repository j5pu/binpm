#!/usr/bin/env bats


setup() {
  load helpers/test_helper
  . helper.sh
}

@test "psargs " {
  run psargs
  [ "$status" -eq 0 ]
  assert_line --regexp "^bash"
}
