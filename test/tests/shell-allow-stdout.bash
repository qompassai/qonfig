#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/shell-allow-stdout
# Qompass AI Qonfig Stdout Bash test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='shell command stdout works'
. '../test-lib.bash'

test_expect_success 'run' '
(run_qonfig | grep "^apple") <<EOF
- shell:
  -
    command: echo apple
    stdout: true
EOF
'
