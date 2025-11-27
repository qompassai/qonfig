#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/link-relink-overwrite-symlink.bash
# Qompass AI Qonfig Symlink Relink Bash Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='relink overwrites symlink'
. '../test-lib.bash'

test_expect_success 'setup' '
echo "apple" > ${DOTFILES}/f &&
echo "grape" > ~/f &&
ln -s ~/f ~/.f
'

test_expect_success 'run' '
run_qonfig <<EOF
- link:
    ~/.f:
      path: f
      relink: true
EOF
'

test_expect_success 'test' '
grep "apple" ~/.f
'
