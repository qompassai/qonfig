#!/usr/bin/env bash
# /qompassai/test/tests/clean-nonexistant bash test
# # Copyright (C) 2025 Qompass AI, All rights reserved
######################################################
test_description='clean ignores nonexistent directories'
. '../test-lib.bash'

test_expect_success 'run' '
run_qonfig <<EOF
- clean: ["~", "~/fake"]
EOF
'
