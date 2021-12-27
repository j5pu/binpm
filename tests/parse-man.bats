#!/usr/bin/env bats
# shellcheck disable=SC1090

setup() {
  load helpers/test_helper
}

setup_file() {
  load helpers/test_helper
  genman
  test_repo_name=repo
  cp -r "${BATS_TOP_TESTS}/${test_repo_name}" "${BATS_FILE_TMPDIR}"
  export REPO_TEST_TMPDIR="${BATS_FILE_TMPDIR}/${test_repo_name}"
  git -C "${REPO_TEST_TMPDIR}" init --quiet
}

paths() {
  PATH="${REPO_TEST_TMPDIR}/bin:${PATH}"; export PATH
  MANPATH="${REPO_TEST_TMPDIR}/share/man${MANPATH:+:${MANPATH}}"; export MANPATH
}

desc() {
  assert genman "${REPO_TEST_TMPDIR}/bin"
  . "${REPO_TEST_TMPDIR}/bin/repo_test.sh"
  paths
  run "${BATS_TEST_DESCRIPTION}" --desc
  assert_success
  assert_output "$( head -1 "${REPO_TEST_TMPDIR}/input/${BATS_TEST_DESCRIPTION}.desc")"
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

@test "parse-man --desc" {
  run parse-man --desc
  assert_line 'show description, help, repository, version or subsections (SYNOPSYS, etc.) from man page'
}

@test "parse-man --version" {
  run parse-man --version
  assert_line --regexp '[0-9].*.[0-9].*.[0-9]'
}

@test "repo_test" {
  desc
}

@test "repo_test.sh" {
  desc
}

@test "repo_test_function" {
  desc
}

@test "repo_test_main" {
  desc
}
