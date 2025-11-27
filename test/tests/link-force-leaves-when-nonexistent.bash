#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/link-force-leaves-when-nonexistant.bash
# Qompass AI Qonfig Nonexistant Link Force Bash Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='force leaves file when target nonexistent'
. '../test-lib.bash'

test_expect_success 'setup' '
mkdir ~/dir &&
touch ~/file
'

test_expect_failure 'run' '
run_qonfig <<EOF
- link:
    ~/dir:
      path: dir
      force: true
    ~/file:
      path: file
      force: true
EOF
'

test_expect_success 'test' '
test -d ~/dir &&
test -f ~/file
'
