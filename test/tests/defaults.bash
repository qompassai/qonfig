#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/defaults.bash
test_description='defaults setting works'
. '../test-lib.bash'

test_expect_success 'setup' '
echo "apple" > ${DOTFILES}/f &&
echo "grape" > ~/f &&
ln -s ~/f ~/.f
'

test_expect_failure 'run-fail' '
run_qonfig <<EOF
- link:
    ~/.f: f
EOF
'

test_expect_failure 'test-fail' '
grep "apple" ~/.f
'

test_expect_success 'run' '
run_qonfig <<EOF
- defaults:
    link:
      relink: true

- link:
    ~/.f: f
EOF
'

test_expect_success 'test' '
grep "apple" ~/.f
'
