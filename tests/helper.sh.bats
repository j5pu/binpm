#!/usr/bin/env bats

setup() {
  load helpers/test_helper
  . helper.sh
}

version() {
  run ${BATS_TEST_DESCRIPTION}
  assert_output "${BATS_SEMVER_NEXT}"
}

@test "helper.sh --version" { version; }
@test "debug --version" { version; }
@test "die --version" { version; }
@test "has --version" { version; }
@test "error --version" { version; }
@test "parse --version" { version; }
@test "psargs --version" { version; }
@test "success --version" { version; }
@test "verbose --version" { version; }
@test "warning --version" { version; }

# shellcheck disable=SC2086
@test "helper.sh lib" {
  assert ${BATS_TEST_DESCRIPTION}
}
