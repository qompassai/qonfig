#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/plugin.bash
# Qompass AI Qonfig Bash Plugin Test
# Copyright (C) 2025 Qompass AI, All rights reserved
####################################################
test_description='plugin loading works'
. '../test-lib.bash'
test_expect_success 'setup' '
cat > ${DOTFILES}/test.py <<EOF
import qonfig
import os.path

class Test(qonfig.Plugin):
    def can_handle(self, directive):
        return directive == "test"

    def handle(self, directive, data):
        with open(os.path.expanduser("~/flag"), "w") as f:
            f.write("it works")
        return True
EOF
'
test_expect_success 'run' '
run_qonfig --plugin test.py <<EOF
- test: ~
EOF
'
test_expect_success 'test' '
grep "it works" ~/flag
'
