#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/shell-disables-stdout.bash
# Qompass AI Qonfig Stdout Disable Bash Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='shell command stdout disabled by default'
. '../test-lib.bash'

test_expect_success 'run' '
(run_qonfig | (! grep "^banana")) <<EOF
- shell:
  - echo banana
EOF
'
