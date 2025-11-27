#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/clean-missing.bash
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='clean deletes links to missing files'
. '../test-lib.bash'

test_expect_success 'setup' '
touch ${DOTFILES}/f &&
ln -s ${DOTFILES}/f ~/.f &&
ln -s ${DOTFILES}/g ~/.g
'

test_expect_success 'run' '
run_qonfig <<EOF
- clean: ["~"]
EOF
'

test_expect_success 'test' '
test -f ~/.f &&
! test -h ~/.g
'
