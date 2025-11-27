#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/clean-outside.bash
# Qompass AI Qonfig Clean-Outside Bash Test
test_description='clean ignores files linking outside dotfiles directory'
. '../test-lib.bash'

test_expect_success 'setup' '
ln -s ${DOTFILES}/f ~/.f &&
ln -s ~/g ~/.g
'

test_expect_success 'run' '
run_qonfig <<EOF
- clean: ["~"]
EOF
'

test_expect_success 'test' '
! test -h ~/.f &&
test -h ~/.g
'
