#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/link-environment-variable-unset.bash
# Qompass AI Qonfig Environment Variable Unset Bash Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='link leaves unset environment variables'
. '../test-lib.bash'

test_expect_success 'setup' '
echo "apple" > ${DOTFILES}/\$ORANGE
'

test_expect_success 'run' '
unset ORANGE &&
run_qonfig <<EOF
- link:
    ~/.f: \$ORANGE
EOF
'

test_expect_success 'test' '
grep "apple" ~/.f
'
