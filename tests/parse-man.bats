#!/usr/bin/env bats

setup() {
  load helpers/test_helper;
}

setup_file() {
  genman
}

success() {
  run sh -c "COMMAND=${2:-git} parse-man --${BATS_TEST_DESCRIPTION}"
  assert_success
  assert_output "${1}"
}
@test "empty" {
  run sh -c 'COMMAND=git parse-man'
  assert_failure
}

@test "name" {
  success 'git - the stupid content tracker'
}

@test "desc" {
  success 'the stupid content tracker'
}

@test "synopsis" {
  success 'bash [options] [command_string | file]' bash
}

@test "version" {
  run sh -c "COMMAND=${2:-git} parse-man --${BATS_TEST_DESCRIPTION}"
  assert_line --regexp '[0-9].*.[0-9].*.[0-9]'
}

@test "help" {
  run sh -c "COMMAND=${2:-git} parse-man --help"
  assert_success
}

@test "help" {
  run sh -c "COMMAND=${2:-git} parse-man --help"
  assert_success
}


# TODO: tests for itself parse-man --help, etc. and manrepo
