#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/config-json-tabs.bash
# Qompass AI Qonfig Config-json-tabs bash test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################

test_description='json config with tabs allowed'
. '../test-lib.bash'
test_expect_success 'setup' '
echo "grape" > ${DOTFILES}/h
'
test_expect_success 'run' '
run_qonfig_json <<EOF
[{
	"link": {
		"~/.i": "h"
	}
}]
EOF
'
test_expect_success 'test' '
grep "grape" ~/.i
'
