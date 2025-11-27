#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/link-relink-relative-leaves-file.bash
# Qompass AI Qonfig Relative Relink Bash Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='relink relative does not incorrectly relink file'
. '../test-lib.bash'

test_expect_success 'setup' '
echo "apple" > ${DOTFILES}/f &&
echo "grape" > ~/.f
'

test_expect_success 'run1' '
run_qonfig <<EOF
- link:
    ~/.folder/f:
      path: f
      create: true
      relative: true
EOF
'

test_expect_success 'test' '
mtime=$(stat ~/.folder/f | grep Modify)
run_qonfig <<EOF
- link:
    ~/.folder/f:
      path: f
      create: true
      relative: true
      relink: true
EOF
[[ "$mtime" == "$(stat ~/.folder/f | grep Modify)" ]]
'
