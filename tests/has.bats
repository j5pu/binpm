#!/usr/bin/env bats
# shellcheck disable=SC2086,SC2153,SC2001

setup() {
  load helpers/test_helper
  path_link="/${BATS_TOP_BASENAME}/tests/bin/link"
}

assertoutput() {
  os="${1:-macOS}"
  bats::description "${os}"
  sh='sh'
  [ "${os}" = 'macOS' ] || { add="'"; sh="container ${os} ${sh}"; }
  # run sh -c "'${cmd} ${*}'"  # macOS
  # run container "${os}" "sh -c '${cmd} ${*}'"  # image
  run ${sh} -c "${add:-}${FIXTURE:+. has-${FIXTURE}.sh &&} . helper.sh && ${BATS_TEST_DESCRIPTION}${add:-}"

  if [ "${ERROR-}" ]; then
    assert_failure
  else
    assert_success
  fi

  if [ "${CALLBACK-}" ]; then
    $(echo "${BATS_TEST_DESCRIPTION}" | sed 's/ /::/g') "${os}"
  else
    [ ! "${EXPECTED-}" ] || assert_output "${EXPECTED}"
  fi
}

cmd() {
  assertoutput
  # FIXME: Images and docker container tests
  { $BATS_LOCAL || [ "${1:-}" = 'local' ]; } || for i in ${IMAGES}; do assertoutput "${i}"; done
}

@test "has" { FIXTURE='sudo'; cmd local; }
@test "has --value" { EXPECTED="alias sudo='sudo'"; FIXTURE='sudo'; cmd local; }
@test "has sudo" { unset EXPECTED; FIXTURE='sudo'; cmd local; }
@test "has --value sudo" { EXPECTED="alias sudo='sudo'"; FIXTURE='sudo'; cmd local; }
@test "has -v sudo" { EXPECTED="alias sudo='sudo'"; FIXTURE='sudo'; cmd local; }
@test "has --path sudo" { unset EXPECTED; FIXTURE='sudo'; cmd local; }
@test "has --value --path sudo" { EXPECTED="$(which sudo)"; FIXTURE='sudo'; cmd local; }

@test "has foo" { unset EXPECTED; FIXTURE='foo'; cmd; }
@test "has --path foo" { ERROR=1; FIXTURE='foo'; cmd; }

@test "has link" { unset ERROR; unset EXPECTED; FIXTURE='link'; cmd; }
@test "has --value link" { EXPECTED="alias link='link'"; FIXTURE='link'; cmd; }
@test "has --path link" { unset EXPECTED; FIXTURE='link'; cmd; }
@test "has -p link" { unset EXPECTED; FIXTURE='link'; cmd; }

has::-pv::link() {
  _path="${path_link}"
  if [ "${1}" = 'macOS' ]; then
    _path="${HOME}${path_link}"
  fi
  assert_output "${_path}"
}
@test "has -pv link" { CALLBACK=1; FIXTURE='link'; cmd; }


has::-vp::link() {
  _path="${path_link}"
  if [ "${1}" = 'macOS' ]; then
    _path="${HOME}${path_link}"
  fi
  assert_output "${_path}"
}
@test "has -vp link" { CALLBACK=1; FIXTURE='link'; cmd; }

has::--value::--path::link() {
  _path="${path_link}"
  if [ "${1}" = 'macOS' ]; then
    _path="${HOME}${path_link}"
  fi
  assert_output "${_path}"
}
@test "has --value --path link" { CALLBACK=1; FIXTURE='link'; cmd; }

has::--all::link() {
  case "${1}" in
    *alpine*|bash*|bats*|nix*) assert_line /bin/busybox ;;
    busybox*|macOS) assert_line /bin/link ;;
    *) assert_line /usr/bin/link ;;
  esac

  case "${1}" in
    macOS) assert_line "${HOME}${path_link}" ;;
    *) assert_line "${path_link}" ;;
  esac
}
@test "has --all link" { CALLBACK=1; FIXTURE='link'; cmd; }

has::-a::link() {
  case "${1}" in
    *alpine*|bash*|bats*|nix*) assert_line /bin/busybox ;;
    busybox*|macOS) assert_line /bin/link ;;
    *) assert_line /usr/bin/link ;;
  esac

  case "${1}" in
    macOS) assert_line "${HOME}${path_link}" ;;
    *) assert_line "${path_link}" ;;
  esac
}
@test "has -a link" { CALLBACK=1; FIXTURE='link'; cmd; }

link() {
  first="${path_link}"; second=/usr/bin/link
  case "${1}" in
    *alpine*|bash*|bats*|nix*) second=/bin/busybox ;;
    macOS) first="${HOME}${path_link}"; second=/bin/link ;;
    busybox*) second=/bin/link ;;
  esac
  assert_output - <<STDIN
${first}
${second}
STDIN
}
@test "link" { CALLBACK=1; unset FIXTURE; cmd; }
