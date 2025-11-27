#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/link-force-overwrite-symlink.bash
# Qompass AI Qonfig Symlink Force Overwrite test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='force overwrites symlinked directory'
. '../test-lib.bash'

test_expect_success 'setup' '
mkdir ${DOTFILES}/dir ~/dir &&
touch ${DOTFILES}/dir/f &&
ln -s ~/ ~/.dir
'

test_expect_success 'run' '
run_qonfig <<EOF
- link:
    ~/.dir:
      path: dir
      force: true
EOF
'

test_expect_success 'test' '
test -f ~/.dir/f
'
