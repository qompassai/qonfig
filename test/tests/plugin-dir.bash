#!/usr/bin/env bash
# /qompassai/qonfig/test/tests/plugin-dir.bash
# Qompass AI plugin-dir-bash test
#
test_description='directory-based plugin loading works'
. '../test-lib.bash'

test_expect_success 'setup' '
mkdir ${DOTFILES}/plugins
cat > ${DOTFILES}/plugins/test.py <<EOF
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
run_qonfig --plugin-dir plugins <<EOF
- test: ~
EOF
'

test_expect_success 'test' '
grep "it works" ~/flag
'
