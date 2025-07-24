#!/usr/bin/env bash
#/qompassai/qonfig/test/test-lib.bash
DEBUG=${DEBUG:-false}
USE_VAGRANT=${USE_VAGRANT:-true}
QONFIG_EXEC=${QONFIG_EXEC:-"/qonfig/bin/qonfig"}
DOTFILES="/home/$(whoami)/.dotfiles"
YAML='qonfig.yaml'
JSON='qonfig.json'
test_run_() {
    if ! ${DEBUG}; then
        (eval "$*") >/dev/null 2>&1
    else
        (eval "$*")
    fi
}
test_expect_success() {
    local tag=${1} && shift
    if ! test_run_ "$@"; then
        >&2 echo "- ${tag} failed."
        exit 1
    fi
}
test_expect_failure() {
    local tag=${1} && shift
    if test_run_ "$@"; then
        >&2 echo "- ${tag} failed."
        exit 1
    fi
}
check_vm() {
    if [ "$(whoami)" != "vagrant" ]; then
        >&2 echo "test can't run outside vm!"
        exit 1
    fi
}
initialize() {
    if ${USE_VAGRANT}; then
        check_vm
    fi
    echo "${test_description}"
    mkdir -p "${DOTFILES}"
    cd
}
run_qonfig() {
    (
        cd "${DOTFILES}"
        cat >"${YAML}"
        ${QONFIG_EXEC} -d . -c "${YAML}" "${@}"
    )
}
run_qonfig_json() {
    (
        cd "${DOTFILES}"
        cat >"${JSON}"
        ${QONFIG_EXEC} -d . -c "${JSON}" "${@}"
    )
}
initialize
