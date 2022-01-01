#!/usr/bin/env bats

setup() {
  load helpers/test_helper
}

@test "color.sh --version" {
  genman
  run ${BATS_TEST_DESCRIPTION}
  assert_output "${BATS_SEMVER_NEXT}"
}

# shellcheck disable=SC2086
@test "color.sh lib" {
  assert ${BATS_TEST_DESCRIPTION}
}
