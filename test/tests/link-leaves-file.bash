#!/usr/bin/env bash
# qompassai/qonfig/test/tests/link-leaves-file.bash
# Qompass AI Qonfig Link-leaves-file bash test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='relink does not overwrite file'
. '../test-lib.bash'

test_expect_success 'setup' '
echo "apple" > ${DOTFILES}/f &&
echo "grape" > ~/.f
'

test_expect_failure 'run' '
run_qonfig <<EOF
- link:
    ~/.f: f
EOF
'

test_expect_success 'test' '
grep "grape" ~/.f
'
