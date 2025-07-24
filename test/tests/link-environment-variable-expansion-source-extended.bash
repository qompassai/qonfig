#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/link-environment-variable-expansino-source-extended.bash
# Qompass AI Qonfig Extended Source Environment Link Variable Bash Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='link expands environment variables in extended config syntax'
. '../test-lib.bash'

test_expect_success 'setup' '
echo "grape" > ${DOTFILES}/h
'

test_expect_success 'run' '
export APPLE="h" &&
run_qonfig <<EOF
- link:
    ~/.i:
      path: \$APPLE
      relink: true
EOF
'

test_expect_success 'test' '
grep "grape" ~/.i
'
