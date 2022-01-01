#!/usr/bin/env bats

setup() {
  load helpers/test_helper
}

@test "top --version" {
  genman
  run ${BATS_TEST_DESCRIPTION}
  assert_output "${BATS_SEMVER_NEXT}"
}
