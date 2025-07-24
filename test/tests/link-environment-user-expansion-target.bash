#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/link-environment-user-expansion-target.bash
# Qompass AI Qonfig Environment Link Bash Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='link expands user in target'
. '../test-lib.bash'

test_expect_success 'setup' '
echo "apple" > ~/f
'

test_expect_success 'run' '
run_qonfig <<EOF
- link:
    ~/g: ~/f
EOF
'

test_expect_success 'test' '
grep "apple" ~/g
'
